using Microsoft.Azure;
using Topshelf;
using Topshelf.HostConfigurators;
using Topshelf.Logging;

namespace ProducerService
{
    class Program:TopshelfRoleEntryPoint
    {
        private readonly LogWriter _log = HostLogger.Get<Program>();
        static int Main(string[] args)
        {
            return (int)HostFactory.Run(new Program().Configure);
        }

        protected override void Configure(HostConfigurator hostConfigurator)
        {
            string svcBusConnection = CloudConfigurationManager.GetSetting("ServiceBusConnectionString_Producer");
            var queueName = CloudConfigurationManager.GetSetting("PublishingQueueName");
            hostConfigurator.Service(s => new Producer(svcBusConnection,queueName), x =>
            {
                x.BeforeStartingService(ctxt => _log.Info("Starting Producer service"));
                x.AfterStoppingService(ctxt => _log.Info("Producer service stopped"));
            });
        }
    }
}
