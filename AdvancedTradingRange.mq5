void OnTick()
{
   //variable for a trading range
   double TradingRange = 0;
   
   //Create variable for highest and lowest candle
   int HighestCandle, LowestCandle;
   
   //Create arrays for highest and lowest candle
   double High[], Low[];
   
   //Sort arrays downward from the current candle
   ArraySetAsSeries(High, true);
   ArraySetAsSeries(Low, true);
   
   //Fill arrays with data for 100 candles
   CopyHigh(_Symbol, _Period, 0, 100, High);
   CopyLow(_Symbol, _Period, 0, 100, Low);
   
   //Calculate the highest candle
   HighestCandle = ArrayMaximum(High, 0, 100);
   
   //Calculate the lowest candle
   LowestCandle = ArrayMinimum(Low, 0, 100);
   
   //Create an array of prices
   MqlRates priceInformation[];
   
   //Sort it from the current candle to oldest canndle
   ArraySetAsSeries(priceInformation, true);
   
   //Copy price data into the array
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   //Highest Line
   
   //Set object properties for a line
   ObjectCreate(_Symbol, "Line1", OBJ_HLINE, 0, 0, priceInformation[HighestCandle].high);
   ObjectSetInteger(0, "Line1", OBJPROP_COLOR, clrMaroon);
   ObjectSetInteger(0, "Line1", OBJPROP_WIDTH, 3);
   ObjectMove(_Symbol, "Line1", 0, 0, priceInformation[HighestCandle].high);
   
   //Lowest Line
   
   //Set object properties for a line
   ObjectCreate(_Symbol, "Line2", OBJ_HLINE, 0, 0, priceInformation[LowestCandle].low);
   ObjectSetInteger(0, "Line2", OBJPROP_COLOR, clrMaroon);
   ObjectSetInteger(0, "Line2", OBJPROP_WIDTH, 3);
   ObjectMove(_Symbol, "Line2", 0, 0, priceInformation[LowestCandle].low);
   
   //Calculate the trading range
   TradingRange = priceInformation[HighestCandle].high - priceInformation[LowestCandle].low;
   
   //Chart Output
   Comment("The current trading range is : ", TradingRange);
   
   
}