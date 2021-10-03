void OnTick()
{
   //Create an array of several prices
   double myPriceArray[];
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   //Define the properties of MacD
   int MacDDefinition = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(MacDDefinition, 0, 0, 3, myPriceArray);
   
   //Get the value of MacD
   float MacDValue = myPriceArray[0];
   
   Comment("MacD Value : ", MacDValue);
}