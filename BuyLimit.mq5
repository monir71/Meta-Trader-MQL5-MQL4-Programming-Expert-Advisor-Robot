#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(OrdersTotal() == 0 && PositionsTotal() == 0)
   {
      trade.BuyLimit(0.01, Bid - (200 * _Point), _Symbol, 0, Ask + (200 * _Point), ORDER_TIME_GTC, 0, NULL);
   }
}