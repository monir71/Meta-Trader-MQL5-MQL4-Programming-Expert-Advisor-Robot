void OnTick()
{
   //Create a price array
   MqlRates priceData[];
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(priceData, true);
   
   //Copy candle prices for 3 candles into the array
   CopyRates(_Symbol, _Period, 0, 3, priceData);
   
   //Create a counter for the candle
   static int candleCounter;
   
   //Create a DateTime variable for the last TimeStamp
   static datetime timeStampLastCheck;
   
   //Create datetime variable for the current candle
   datetime timeStampCurrentCandle;
   
   //Read timestamp for current candle in array
   timeStampCurrentCandle = priceData[0].time;
   
   //if the currrent timestamp different from last time
   if(timeStampCurrentCandle != timeStampLastCheck)
   {
      //Remember current timestamp for next time
      timeStampLastCheck = timeStampCurrentCandle;
      
      //Add 1 to the candleCounter
      candleCounter += 1;
   }
   
   //Chart output
   Comment("\n\nCounted candle since start: ", candleCounter);
   
}