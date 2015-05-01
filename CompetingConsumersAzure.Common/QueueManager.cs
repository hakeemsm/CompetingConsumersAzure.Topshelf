using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;

namespace CompetingConsumersAzure.Common
{
    public class QueueManager
    {
        private readonly string _queueName;
        private readonly string _connectionString;
        private QueueClient _client;
        private ManualResetEvent _processingEvent;


        public QueueManager(string queueName, string connectionString)
        {
            _queueName = queueName;
            _connectionString = connectionString;
            _processingEvent = new ManualResetEvent(false);
        }

        public async Task Start()
        {
            var namespaceManager = NamespaceManager.CreateFromConnectionString(_connectionString);
            if (!namespaceManager.QueueExists(_queueName))
            {
                try
                {
                    var queueDescription = new QueueDescription(_queueName) { MaxDeliveryCount = 3 };
                    await namespaceManager.CreateQueueAsync(queueDescription);
                }
                catch (MessagingEntityAlreadyExistsException)
                {
                    Trace.TraceWarning("Queue already exists for path: {0}", _queueName);
                }
                catch (MessagingException ex)
                {
                    var webException = ex.InnerException as WebException;
                    if (webException != null)
                    {
                        var response = webException.Response as HttpWebResponse;
                        if (response == null || response.StatusCode != HttpStatusCode.Conflict)
                        {
                            throw;
                        }

                        Trace.TraceWarning("HttpStatusCode.Conflict - Queue likely already exists or is being created or deleted for path: {0}",
                            _queueName);
                    }
                }

            }

            // Initialize the connection to Service Bus Queue
            _client = QueueClient.CreateFromConnectionString(_connectionString, _queueName);
        }

        public async Task Stop(TimeSpan waitTime)
        {
            _processingEvent.Reset();
            Thread.Sleep(waitTime);
            if (!_client.IsClosed)
            {
                await _client.CloseAsync();
            }
            var namespaceManager = NamespaceManager.CreateFromConnectionString(_connectionString);
            if (await namespaceManager.QueueExistsAsync(_queueName))
            {
                try
                {
                    await namespaceManager.DeleteQueueAsync(_queueName);
                }
                catch (MessagingEntityNotFoundException)
                {
                    Trace.TraceWarning("Can't delete Queue at path {0}. It does not exist", _queueName);
                    throw;
                }
            }
        }

        public void ReceiveMessages(Func<BrokeredMessage, Task> processMessageTask)
        {
            var messageOptions = new OnMessageOptions { AutoComplete = false, MaxConcurrentCalls = 10 };
            messageOptions.ExceptionReceived += OnExceptionReceived;

            _client.OnMessageAsync(async (msg) =>
            {
                //_processingEvent.WaitOne();
                Trace.WriteLine("Calling processMessageTask...");
                await processMessageTask(msg);
            }, messageOptions);
        }

        private void OnExceptionReceived(object sender, ExceptionReceivedEventArgs e)
        {
            if (e != null && e.Exception != null)
            {
                var exceptionMessage = e.Exception.Message;
                Trace.TraceError("Exception in QueueClient.ExceptionReceived: {0}", exceptionMessage);
            }
        }

        public async Task SendMessagesAsync(List<BrokeredMessage> messages)
        {
            await _client.SendBatchAsync(messages);
            Trace.WriteLine(messages.Count + " messages produced");
        }


    }
}
