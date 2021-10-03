void OnTick()
{
   //Create price array
   MqlRates priceInformation[];
   
   //Sort it from current candle to oldest
   ArraySetAsSeries(priceInformation, true);
   
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   
   
   //Create two bands of envelopes
   double UpperBandArray[], LowerBandArray[];
   
   //Sort the price arrays from the current candle downwards
   ArraySetAsSeries(UpperBandArray, true);
   ArraySetAsSeries(LowerBandArray, true);
   
   //Define envelopes
   int EnvelopesDefinition = iEnvelopes(_Symbol, _Period, 14, 0, MODE_SMA, PRICE_CLOSE, 0.100);
   
   //Copy prices information into the array
   CopyBuffer(EnvelopesDefinition, 0, 0, 3, UpperBandArray);
   CopyBuffer(EnvelopesDefinition, 1, 0, 3, LowerBandArray);
   
   //Calculate EA for the current candle
   double UpperBandValue = NormalizeDouble(UpperBandArray[0], 6);
   double LowerBandValue = NormalizeDouble(LowerBandArray[0], 6);
   
   //Chart output of the EA
   if(priceInformation[0].close > UpperBandValue) Comment("UPPER SIGNAL");
   if(priceInformation[0].close < LowerBandValue) Comment("LOWER SIGNAL");
   
   if(priceInformation[0].close < UpperBandValue && priceInformation[0].close > LowerBandValue) 
      Comment("Upper Band Value: ", UpperBandValue, "\n\nLower Band Value: ", LowerBandValue);

}