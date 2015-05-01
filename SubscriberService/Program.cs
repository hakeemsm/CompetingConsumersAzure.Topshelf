using System;
using System.Diagnostics;
using System.IO;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Topshelf;
using Topshelf.HostConfigurators;
using Topshelf.Logging;

namespace SubscriberService
{
    class Program:TopshelfRoleEntryPoint
    {
        private readonly LogWriter _logger = HostLogger.Get<Program>();

        static int Main(string[] args)
        {
            Trace.Listeners.Clear();
            var consoleWriter = Console.Out;
            Trace.Listeners.Add(new ConsoleTraceListener());
            return (int)HostFactory.Run(new Program().Configure); 
        }

        protected override void Configure(HostConfigurator hostConfigurator)
        {
            string svcBusConnection = CloudConfigurationManager.GetSetting("ServiceBusConnectionString_Subscriber");
            var queueName = CloudConfigurationManager.GetSetting("ReceivingQueueName");
            var storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("MessageStorageConnectionString"));
            
            hostConfigurator.Service(s => new Subscriber(svcBusConnection, queueName, storageAccount), x =>
            {
                x.BeforeStartingService(ctxt => _logger.Info("Starting Subscriber service"));
                x.AfterStoppingService(ctxt => _logger.Info("Subscriber Service stopped"));
            });
        }
    }
}
