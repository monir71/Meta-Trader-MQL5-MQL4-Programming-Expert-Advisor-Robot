void OnTick()
{
   //Create an array of several prices
   double myPriceArray[];
   
   //Define Bulls Power Oscillator
   int BullsPowerDefinition = iBullsPower(_Symbol, _Period, 13);
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(BullsPowerDefinition, 0, 0, 3, myPriceArray);
   
   //Get the value of Bulls Power Oscillator
   //Float for human readable
   float BullsPowerValue = myPriceArray[0];
   
   Comment("Bulls Power Value: ", BullsPowerValue);
}