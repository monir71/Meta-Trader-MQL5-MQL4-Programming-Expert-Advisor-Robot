#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double movingAverageArray[];
   
   ArraySetAsSeries(movingAverageArray, true);
   
   int movingAverageDefinition = iMA(_Symbol, _Period, 100, 0, MODE_SMA, PRICE_CLOSE);
   
   CopyBuffer(movingAverageDefinition, 0, 0, 10, movingAverageArray);
   
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   double Trend100 = (movingAverageArray[0] - movingAverageArray[1]);
   
   if(Trend100 < 0)
      if(PositionsTotal() == 0 && OrdersTotal() == 0)
         trade.SellStop(0.10, Bid - 100 * _Point, NULL, 0, Bid - 300 * _Point, ORDER_TIME_GTC, 0, NULL);
}