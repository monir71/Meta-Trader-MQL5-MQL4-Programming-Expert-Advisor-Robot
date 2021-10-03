#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   double DynamicPositionSize = NormalizeDouble(Equity / 1000000, 2);
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   if(PositionsTotal() < 10 && OrdersTotal() < 10)
   {
      trade.BuyStop(DynamicPositionSize, Ask + 100 * _Point, NULL, 0, Ask + 300 * _Point, ORDER_TIME_GTC, 0, NULL);
   }
   
   Comment("Positionn Size: ", DynamicPositionSize);
   
}