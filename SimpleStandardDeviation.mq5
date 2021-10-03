void OnTick()
{
   //Create a price array
   double StadardDeviationArray[];
   
   //Standard Deviation Definition
   int StandardDeviationDefinition = iStdDev(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE);
   
   //Sort the price array from the current candle downwards
   ArraySetAsSeries(StadardDeviationArray, true);
   
   //Define EA, current candle, 3 candles, store result
   CopyBuffer(StandardDeviationDefinition, 0, 0, 3, StadardDeviationArray);
   
   //Calculate EA from the current candle
   double StandardDeviationValue = NormalizeDouble(StadardDeviationArray[0], 6);
   
   Comment("Standard Deviation: ", StandardDeviationValue);
}