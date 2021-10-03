void OnTick()
{
   //Create an array of prices
   double myPriceArray[];
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   //Define Money Flow Index (MFI)
   int MoneyFlowIndexDefinition = iMFI(_Symbol, _Period, 14, VOLUME_TICK);
   
   //Define EA, one line, current candle, 3 candles, store result in array
   CopyBuffer(MoneyFlowIndexDefinition, 0, 0, 3, myPriceArray);
   
   //Get the value of MFI
   double MoneyFlowIndexValue = NormalizeDouble(myPriceArray[0], 2);
   
   if(MoneyFlowIndexValue > 80) Comment("OVER BOUGHT ", MoneyFlowIndexValue);
   if(MoneyFlowIndexValue < 20) Comment("OVER SOLD ", MoneyFlowIndexValue);
   if(MoneyFlowIndexValue < 80 && MoneyFlowIndexValue > 20) Comment("Money Flow Index Value ", MoneyFlowIndexValue);
   
}