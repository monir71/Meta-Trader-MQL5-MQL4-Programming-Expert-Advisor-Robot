void OnTick()
{
   Comment("Signal ", GetSignalMovingAverage());
}

string GetSignalMovingAverage()
{
   string signal = "";
   
   MqlRates priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInfo);
   
   double movingAverageArray[];
   ArraySetAsSeries(movingAverageArray, true);
   int movingAverageHandler = iMA(_Symbol, _Period, 10, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(movingAverageHandler, 0, 0, 3, movingAverageArray);
   
   double movingAverageValue = movingAverageArray[0];
   
   if(priceInfo[1].close > movingAverageValue && priceInfo[2].close < movingAverageValue)
      signal = "Buy";
   if(priceInfo[1].close < movingAverageValue && priceInfo[2].close > movingAverageValue)
      signal = "Sell";
   
   return signal;
}