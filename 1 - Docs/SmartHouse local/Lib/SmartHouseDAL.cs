
using System.Data.Entity;

namespace SmartHouse
{
    public class SmartHouseDAL
    {
        //OLD StringConnection
        //"Data Source=THAIAN-PC\SMARTHOUSE;Failover Partner=JOHNNY\SMARTHOUSE;Initial Catalog=SmartHouse;Integrated Security=True";
       // string SQLConnection = "Server=.\\SQLExpress;Database=SmartHouse;Trusted_Connection=Yes;Integrated Security=True;";
        string SQLConnection = @"Data Source=THAIAN-PC\SMARTHOUSE;Initial Catalog=SmartHouse;Integrated Security=True";
           
        protected DbContext context { get; set; }
        public SmartHouseDAL()
        {
            context = new DbContext(SQLConnection);
        }
    }
}
