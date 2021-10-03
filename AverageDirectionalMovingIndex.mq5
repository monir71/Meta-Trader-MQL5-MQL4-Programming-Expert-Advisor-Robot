void OnTick()
{
   //Create a price array
   double myPriceArray[];
   double PositiveDirectionalIndicatorArray[];
   double NegativeDirectionalIndicatorArray[];
   
   //Set the price array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   ArraySetAsSeries(PositiveDirectionalIndicatorArray, true);
   ArraySetAsSeries(NegativeDirectionalIndicatorArray, true);
   
   //Dine Average Directional Moving Index (ADX)
   int AverageDirectionalMovingIndexDefinition = iADX(_Symbol, _Period, 14);
   int PositiveDirectionalIndicatorDefinition = iADX(_Symbol, _Period, 14);
   int NegativeDirectionalIndicatorDefinition = iADX(_Symbol, _Period, 14);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(AverageDirectionalMovingIndexDefinition, 0, 0, 3, myPriceArray);
   CopyBuffer(PositiveDirectionalIndicatorDefinition, 1, 0, 3, PositiveDirectionalIndicatorArray);
   CopyBuffer(NegativeDirectionalIndicatorDefinition, 2, 0, 3, NegativeDirectionalIndicatorArray);
   
   //Get the value
   double AverageDirectionalMovingIndexValue = NormalizeDouble(myPriceArray[0], 2);
   double PositiveDirectionalIndicatorValue = NormalizeDouble(PositiveDirectionalIndicatorArray[0], 2);
   double NegativeDirectionalIndicatorValue = NormalizeDouble(NegativeDirectionalIndicatorArray[0], 2);
   
   //Chart output
   Comment("ADX Value : ", AverageDirectionalMovingIndexValue, "\nPositive Directional Indicator (-DI) : ",
   PositiveDirectionalIndicatorValue, "\nNegaltive Directional Indicator (-DI) : ", NegativeDirectionalIndicatorValue);
}