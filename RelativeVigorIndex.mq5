void OnTick()
{
   //Create an array of Relative Vigor Index
   double RelativeVigorIndexArray[];
   
   //Create an array of Relative Vigor Signal
   double RelativeVigorSignalArray[];
   
   //Sort Relative Vigor Index array from the current candle downwards
   ArraySetAsSeries(RelativeVigorIndexArray, true);
   
   //Sort Relative Vigor Signal array from the current candle downwards
   ArraySetAsSeries(RelativeVigorSignalArray, true);
   
   //Define Relative Vigor Index
   int RelativeVigorIndex = iRVI(_Symbol, _Period, 10);
   
   //Define EA, line one, current candle, 3 candles, store result in Relative Vigor Index Array
   CopyBuffer(RelativeVigorIndex, 0, 0, 3, RelativeVigorIndexArray);
   
   //Define EA, line two, current candle,3 candles. store result in Relative Vigor Signal Array
   CopyBuffer(RelativeVigorIndex, 1, 0, 3, RelativeVigorSignalArray);
   
   //Get the value of the Relative Vigor Index
   double RelativeVigorIndexValue = RelativeVigorIndexArray[0];
   
   //Get the value of the Relative Vigor Signal
   double RelativeVigorSignalValue = RelativeVigorSignalArray[0];
   
   //Chart Output
   if(RelativeVigorIndexValue > RelativeVigorSignalValue && RelativeVigorIndexValue > 0)
      Comment("Up Trend\n\nRelative Vigor Index: ",  RelativeVigorIndexValue, 
         "\nRelative Vigor Index Signal: ", RelativeVigorSignalValue);
         
   if(RelativeVigorIndexValue < RelativeVigorSignalValue && RelativeVigorIndexValue < 0)
      Comment("Down Trend\n\nRelative Vigor Index: ",  RelativeVigorIndexValue, 
         "\nRelative Vigor Index Signal: ", RelativeVigorSignalValue);
}