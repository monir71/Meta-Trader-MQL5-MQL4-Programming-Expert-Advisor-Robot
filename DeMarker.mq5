void OnTick()
{
   //Create an array of several prices
   double myPriceArray[];
   
   //Define the properties of DeMarker EA
   int DemarkerDefinition = iDeMarker(_Symbol, _Period, 14);
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(DemarkerDefinition, 0, 0, 3, myPriceArray);
   
   //Get the Value
   double DeMarkerValue = myPriceArray[0];
   
   if(DeMarkerValue > 0.7) Comment("Strong Trend: ", DeMarkerValue);
   if(DeMarkerValue < 0.3) Comment("Weak Trend: ", DeMarkerValue);
   if(DeMarkerValue < 0.7 && DeMarkerValue > 0.3) Comment("");
}