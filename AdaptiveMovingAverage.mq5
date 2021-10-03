void OnTick()
{
   //Create ann array of several prices
   double AdaptiveMovingAverageArray[];
   
   //Define the properties of adaptive moving average
   int AdaptiveMovingAverageDefinition = iAMA(_Symbol, _Period, 9, 2, 30, 0, PRICE_CLOSE);
   
   //Sort the price array from current candle downwards
   ArraySetAsSeries(AdaptiveMovingAverageArray, true);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(AdaptiveMovingAverageDefinition, 0, 0, 3, AdaptiveMovingAverageArray);
   
   //Get the value
   double AdaptiveMovingAverageValue = AdaptiveMovingAverageArray[0];
   
   Comment("Adaptive Moving Average Value : ", AdaptiveMovingAverageValue);
   
}