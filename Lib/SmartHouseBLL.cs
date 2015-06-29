using System;
using System.Transactions;

namespace SmartHouse
{

    public class SmartHouseBLL
    {
        public TransactionScope ts;
        public SmartHouseBLL()
        {
        }
        public TransactionScope newTransactionScope() {
            return new TransactionScope(TransactionScopeOption.Required);
        }
    }
}
