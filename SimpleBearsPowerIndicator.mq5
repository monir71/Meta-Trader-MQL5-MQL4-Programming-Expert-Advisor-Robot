void OnTick()
{
   //Create an array of prices
   double priceArray[];
   
   //Bears Power Definition
   int BearsPowerDefinition = iBearsPower(_Symbol, _Period, 13);
   
   //Sort prices from the current candle downwards
   ArraySetAsSeries(priceArray, true);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(BearsPowerDefinition, 0, 0, 3, priceArray);
   
   //Get the value of the ccurrent candle
   float BearsPowerValue = priceArray[0];
   
   Comment("Bears Power Value: ", BearsPowerValue);
}