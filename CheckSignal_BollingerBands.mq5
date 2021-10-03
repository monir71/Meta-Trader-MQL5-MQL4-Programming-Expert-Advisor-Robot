string CheckSignal_BollinngerBands()
{
   //We create an array for the prices
   MqlRates PriceInfo[];
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(PriceInfo, true);
   
   //We fill the array with price data
   //For all candles in the chart: int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), PriceInfo);
   int Data = CopyRates(Symbol(), Period(), 0, 3, PriceInfo);
   
   //Create a string variable for the signal
   string signal = "";
   
   //Create arrays for prices
   double UpperBandsArray[];
   double MiddleBandArray[];
   double LowerBandArray[];
   
   //Define Bollinnger Bands
   int BollinngerBandsDefinition = iBands(_Symbol, _Period, 20, 0, 2, PRICE_CLOSE);
   
   //Copy price info into the arrays
   CopyBuffer(BollinngerBandsDefinition, 0, 0, 3, MiddleBandArray);
   CopyBuffer(BollinngerBandsDefinition, 1, 0, 3, UpperBandsArray);
   CopyBuffer(BollinngerBandsDefinition, 2, 0, 3, LowerBandArray);
   
   //Calculate EA for the last candle
   double MiddleBandValueLast = MiddleBandArray[0];
   double UpperBandValueLast = UpperBandsArray[0];
   double LowerBandValueLast = LowerBandArray[0];
   
   //Calculate EA for the last but one candle
   double MiddleBandValueLastButOne = MiddleBandArray[1];
   double UpperBandValueLastButOne = UpperBandsArray[1];
   double LowerBandValueLastButOne = LowerBandArray[1];
   
   //Buy signal
   if(PriceInfo[1].close < LowerBandValueLastButOne && PriceInfo[0].close > LowerBandValueLast)
   signal = "Buy";
   
   //Sell Signal
   if(PriceInfo[1].close > UpperBandValueLastButOne && PriceInfo[0].close < UpperBandValueLast)
   signal = "Sell";
   
   return signal;
   
}