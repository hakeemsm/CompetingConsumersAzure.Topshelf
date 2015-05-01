using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using CompetingConsumersAzure.Common;
using Microsoft.ServiceBus.Messaging;
using Topshelf;
using Topshelf.Logging;

namespace ProducerService
{
    public class Producer : ServiceControl
    {
        private readonly string _svcBusConnection;
        private readonly string _queueName;
        private readonly LogWriter _logger = HostLogger.Get<Producer>();
        private Task _task;
        private readonly CancellationTokenSource _cancel=new CancellationTokenSource();
        private QueueManager _queueManager;
        private const string Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        public Producer(string svcBusConnection, string queueName)
        {
            _svcBusConnection = svcBusConnection;
            _queueName = queueName;
        }

        public bool Start(HostControl hostControl)
        {
            _logger.Info("Producer service starting");
            _queueManager = new QueueManager(_queueName, _svcBusConnection);
            _queueManager.Start().Wait();
            _task = StartProducing();
            return true;
        }

        private async Task StartProducing()
        {
            if (_cancel.Token.IsCancellationRequested)
            {
               _logger.Info("Cancelling out..");
                return;
            }
            await Task.Yield();
            _queueManager.SendMessagesAsync(GetMessages()).Wait();
            await Task.Delay(1000);
            await StartProducing();
        }

        private List<BrokeredMessage> GetMessages()
        {
            var messages = new List<BrokeredMessage>();

            for (int i = 0; i < 12; i++)
            {
                messages.Add(new BrokeredMessage(new MessageData(GetData() + "_PK" + i, GetData() + "_RK" + i) { Id = i, Data = GetData() }) { MessageId = Guid.NewGuid().ToString() });
            }
            return messages;

        }

        private string GetData()
        {
            var random = new Random();
            return new string(Enumerable.Repeat(Chars, 7).Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public bool Stop(HostControl hostControl)
        {
            _cancel.Cancel();
            //_queueManager.Stop(TimeSpan.FromSeconds(30)).Wait();
            _task.Wait();
            return true;
        }
    }
}