#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(PositionsTotal() < 1)
   {
      trade.Buy(0.10, NULL, Ask, 0, Ask + (300 * _Point), NULL);
      trade.Sell(0.10, NULL, Bid, 0, Bid - (300 * _Point), NULL);
   }
   
   string myLastProfit = GetLastProfit();
   
   Comment("My last profit was: \n", myLastProfit);
}

string GetLastProfit()
{
   uint TotalNumberOfDeals = HistoryDealsTotal();
   ulong TicketNumber = 0;
   long OrderType, DealEntry;
   double OrderProfit = 0;
   string MySymbol = "";
   string PositionDirection = "";
   string MyResult = "";
   
   //Get  the History
   HistorySelect(0, TimeCurrent());
   
   //Go through all the deals
   for(uint i = 0; i < TotalNumberOfDeals; i++)
   {
      //We look for a ticket number
      if((TicketNumber = HistoryDealGetTicket(i)) > 0)
      {
         //Get the Profit
         OrderProfit = HistoryDealGetDouble(TicketNumber, DEAL_PROFIT);
         //Get the type
         OrderType = HistoryDealGetInteger(TicketNumber, DEAL_TYPE);
         //Get the Currency Pair
         MySymbol = HistoryDealGetString(TicketNumber, DEAL_SYMBOL);
         //Get the deal entry typre to check for close type
         DealEntry = HistoryDealGetInteger(TicketNumber, DEAL_ENTRY);
         
         //Ifcurremcy pair fits
         if(MySymbol == _Symbol)
         //If it is a buy or sell order
         if(OrderType == ORDER_TYPE_BUY || OrderType == ORDER_TYPE_SELL)
         //If the order was closed
         if(DealEntry == 1)
         {
            //Set sell order type if close type was buy
            if(OrderType == ORDER_TYPE_BUY)
               PositionDirection = "SELL TRADE";
            //Set buy order type if close type was sell
            if(OrderType == ORDER_TYPE_SELL)
               PositionDirection = "BUY TRADE";
            MyResult += "Profit : " + OrderProfit + " Ticket : " + TicketNumber + " Position Direction : " + PositionDirection + "\n";
         }
      }     
   }
   return MyResult;
}