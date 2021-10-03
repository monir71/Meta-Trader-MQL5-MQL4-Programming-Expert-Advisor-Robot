#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(PositionsTotal() == 0 && OrdersTotal() == 0)
      trade.SellLimit(0.01, Ask + (200 * _Point), _Symbol, 0, Bid - (200 * _Point), ORDER_TIME_GTC, 0, 0);
      
}