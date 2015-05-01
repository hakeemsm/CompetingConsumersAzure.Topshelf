using System;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using CompetingConsumersAzure.Common;
using Microsoft.ServiceBus.Messaging;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using Topshelf;
using Topshelf.Logging;

namespace SubscriberService
{
    internal class Subscriber : ServiceControl
    {
        private readonly string _svcBusConnection;
        private readonly string _queueName;
        private readonly LogWriter _logger = HostLogger.Get<Subscriber>();
        private Task _task;
        private readonly CloudStorageAccount _storageAccount;
        private CloudTable _tableRef;
        private QueueManager _queueManager;
        private readonly CancellationTokenSource _cancel = new CancellationTokenSource();
        public Subscriber(string svcBusConnection, string queueName, CloudStorageAccount storageAccount)
        {
            _svcBusConnection = svcBusConnection;
            _queueName = queueName;
            _storageAccount = storageAccount;
        }

        public bool Start(HostControl hostControl)
        {
            _logger.Info("Subscriber service starting");
            _queueManager = new QueueManager(_queueName, _svcBusConnection);
            _queueManager.Start().Wait();
            var cloudTableClient = _storageAccount.CreateCloudTableClient();
            _tableRef = cloudTableClient.GetTableReference("MessageData");
            _tableRef.CreateIfNotExists();
            _task = StartConsuming();
            return true;
        }

        private async Task StartConsuming()
        {
            if (_cancel.Token.IsCancellationRequested)
            {
                _logger.Info("Cancelling out..");
                return;
            }
            await Task.Yield();
            _queueManager.ReceiveMessages(ProcessMessageTask);
            await Task.Delay(1000);
            await StartConsuming();
        }

        private async Task ProcessMessageTask(BrokeredMessage receivedMessage)
        {
            try
            {
                // Process the message
                Trace.WriteLine("Processing received messages");
                if (!IsValid(receivedMessage))
                {
                    await receivedMessage.DeadLetterAsync("Invalid message", "Message Id is invalid or there is no message body");
                    Trace.WriteLine("Invalid message. Sending to dead letter queue");
                }
                await Task.Delay(TimeSpan.FromSeconds(3)).ConfigureAwait(false);
                var messageData = receivedMessage.GetBody<MessageData>();

                //var roleInstanceId = RoleEnvironment.IsAvailable
                //    ? RoleEnvironment.CurrentRoleInstance.Id
                //    : string.Empty;
                var traceMsg = string.Format("Received message with sequence #: {0}, Id: {1}, MessageBodyId:{2}, MessageData:{3}, PartitionKey:{4}, RowKey:{5} by Role:{6}",
                    receivedMessage.SequenceNumber, receivedMessage.MessageId, messageData.Id, messageData.Data, ""
                    , messageData.PartitionKey, messageData.RowKey);
                //var traceMsg = string.Format("Received message with sequence #: {0}, Id: {1}, MessageBodyId:{2}, MessageData:{3} by Role:{4}",
                //    receivedMessage.SequenceNumber,receivedMessage.MessageId,messageData.Id,messageData.Data, RoleEnvironment.CurrentRoleInstance.Id);
                Trace.WriteLine(traceMsg);
                var insertOp = TableOperation.Insert(messageData);
                _tableRef.Execute(insertOp);
                await receivedMessage.CompleteAsync();
            }
            catch (Exception ex)
            {
                receivedMessage.Abandon();
                Trace.TraceError("Exception processing message: {0}", ex.Message);
                if (ex.InnerException != null)
                {
                    Trace.TraceError("Inner Exception: {0}", ex.InnerException.Message);
                }
            }
        }

        private bool IsValid(BrokeredMessage receivedMessage)
        {
            return !string.IsNullOrWhiteSpace(receivedMessage.MessageId) ||
                   receivedMessage.GetBody<MessageData>() == null;
        }

        public bool Stop(HostControl hostControl)
        {
            _cancel.Cancel();
            _queueManager.Stop(TimeSpan.FromMilliseconds(1)).Wait();
            //_task.Wait();
            return true;
        }
    }
}