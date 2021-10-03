string checkEntry()
{
   //Create an empty string
   string entry = "";
   
   //Create two array of several prices
   double myMovingAverageArray1[];
   double myMovingAverageArray2[];
   
   //Define the properties of moving average 1
   int myMovingAverageDefinition1 = iMA(_Symbol, _Period, 20, 0, MODE_EMA, PRICE_CLOSE);
   
   //Define the properties of moving average 2
   int myMovingAverageDefinition2 = iMA(_Symbol, _Period, 50, 0, MODE_EMA, PRICE_CLOSE);
   
   //Sort the price array 1 from the current candle downwards
   ArraySetAsSeries(myMovingAverageArray1, true);
   
   //Sort the price array 2 from the current candle downwards
   ArraySetAsSeries(myMovingAverageArray2, true);
   
   //Define MA1 EA, one line, current candle, 3 candles, store result
   CopyBuffer(myMovingAverageDefinition1, 0, 0, 3, myMovingAverageArray1);
   
   //Define MA2 EA, one line, current candle, 3 candles, store result
   CopyBuffer(myMovingAverageDefinition2, 0, 0, 3, myMovingAverageArray2);
   
   //Calculate MA1 for the current candle
   double myMovingAverageValue1 = myMovingAverageArray1[0];
   
   //Calculate MA2 for the current candle
   double myMovingAverageValue2 = myMovingAverageArray2[0];
   
   //Check if the 20 candles EA is over the 50 candles EA
   if(myMovingAverageArray1[0] > myMovingAverageArray2[0]
      && myMovingAverageArray1[1] < myMovingAverageArray2[1])
         entry = "BUY";
         
   if(myMovingAverageArray1[0] < myMovingAverageArray2[0]
      && myMovingAverageArray1[1] > myMovingAverageArray2[1])
         entry = "SELL";
         
   //Return the entry signal
   return entry;
   
}