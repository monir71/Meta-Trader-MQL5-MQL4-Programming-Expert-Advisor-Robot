void OnTick()
{
   //Create an array of several prices
   double myPriceArray[];
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   //Define the properties of Force Index
   int ForceIndexDefinition = iForce(_Symbol, _Period, 13, MODE_SMA, VOLUME_TICK);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(ForceIndexDefinition, 0, 0, 3, myPriceArray);
   
   //Get the value of the Force Index
   double ForceIndexValue = NormalizeDouble(myPriceArray[0], 6);
   
   if(ForceIndexValue > 0) Comment("Trending Upwards: ", ForceIndexValue);
   if(ForceIndexValue < 0) Comment("Trending downwards: ", ForceIndexValue);
}