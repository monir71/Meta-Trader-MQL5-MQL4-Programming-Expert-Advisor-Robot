#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   if(PositionsTotal() == 0 && OrdersTotal() == 0)
   {
      trade.BuyStop(0.01, Ask + 200 * _Point, NULL, 0, Ask + 300 * _Point, ORDER_TIME_GTC, 0, NULL);
      
      trade.SellStop(0.01, Bid - 200 * _Point, NULL, 0, Bid - 300 * _Point, ORDER_TIME_GTC, 0, NULL);   
   }
   
   if(Balance != Equity)
   {
      CancelOrder();
   }
      
}

void CancelOrder()
{
   for(int i = OrdersTotal() - 1; i >= 0; i--)
   {
      ulong OrderTicket = OrderGetTicket(i);
      
      trade.OrderDelete(OrderTicket);
   }
}