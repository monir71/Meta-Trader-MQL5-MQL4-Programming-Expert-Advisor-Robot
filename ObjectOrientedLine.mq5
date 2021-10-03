void OnTick()
{
   //Create variable for highest candle
   int HighestCandle;
   
   //Create arrays for highest canndle
   double High[];
   
   //Sort array downwards from the current candle
   ArraySetAsSeries(High, true);
   
   //Fill array with data of 100 candles
   CopyHigh(_Symbol, _Period, 0, 100, High);
   
   //Calculate the highest candle
   HighestCandle = ArrayMaximum(High, 0, 100);
   
   //Create an array for prices
   MqlRates priceInformation[];
   
   //Sort the array from current candle to older candle
   ArraySetAsSeries(priceInformation, true);
   
   //Copy price data into the array
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   //Set object properties for a line
   ObjectCreate(_Symbol, "Line1", OBJ_HLINE, 0, 0, priceInformation[HighestCandle].high);
   
   //Set object color
   ObjectSetInteger(0, "Line1", OBJPROP_COLOR, clrRed);
   
   //Set object width
   ObjectSetInteger(0, "Line1", OBJPROP_WIDTH, 3);
   
   //Move the line
   ObjectMove(_Symbol, "Line1", 0, 0, priceInformation[HighestCandle].high);
   
}