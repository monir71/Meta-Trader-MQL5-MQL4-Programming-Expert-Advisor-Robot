void OnTick()
{
   int highestCandleIndex;
   int lowestCandleIndex;
   
   double highestCandleValue;
   double lowestCandleValue;
   double AverageCandleValue;
   
   double highArray[];
   double lowArray[];
   
   ArraySetAsSeries(highArray, true);
   ArraySetAsSeries(lowArray, true);
   
   CopyHigh(_Symbol, _Period, 0, 50, highArray);
   CopyLow(_Symbol, _Period, 0, 50, lowArray);
   
   highestCandleIndex = ArrayMaximum(highArray, 0, WHOLE_ARRAY);
   lowestCandleIndex = ArrayMinimum(lowArray, 0, WHOLE_ARRAY);
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   highestCandleValue = NormalizeDouble(priceInformation[highestCandleIndex].high, 6);
   lowestCandleValue = NormalizeDouble(priceInformation[lowestCandleIndex].low, 6);
   AverageCandleValue = NormalizeDouble((highestCandleValue + lowestCandleValue) / 2, 6);
   
   Comment("High : ", highestCandleValue, "\nLow: ", lowestCandleValue, "\nAverage : ", AverageCandleValue);

}