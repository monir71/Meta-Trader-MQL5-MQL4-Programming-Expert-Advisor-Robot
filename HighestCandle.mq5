#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double HighestCandle;
   double High[];
   ArraySetAsSeries(High, true);
   CopyHigh(_Symbol, PERIOD_M1, 0, 11, High);
   HighestCandle = ArrayMaximum(High, 0, 11);
   Comment("\n\nHighest candle within last 10 candles: ", HighestCandle);
}