using Microsoft.WindowsAzure.Storage.Table;

namespace CompetingConsumersAzure.Common
{
    public class MessageData : TableEntity
    {


        public MessageData()
        {

        }

        public MessageData(string partitionKey, string rowKey)
        {
            PartitionKey = partitionKey;
            RowKey = rowKey;
        }

        public int Id { get; set; }
        public string Data { get; set; }
    }
}