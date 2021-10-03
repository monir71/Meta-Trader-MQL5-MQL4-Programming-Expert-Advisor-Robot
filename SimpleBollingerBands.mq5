void OnTick()
{
   //Create an array for several prices
   double UpperBandArray[];
   double MiddleBandArray[];
   double LowerBandArray[];
   
   //Sort the price array from the current candle downwards
   ArraySetAsSeries(UpperBandArray, true);
   ArraySetAsSeries(MiddleBandArray, true);
   ArraySetAsSeries(LowerBandArray, true);
   
   //Define Bollinger Bands
   int BollingerBandsDefiniition = iBands(_Symbol, _Period, 20, 0, 2, PRICE_CLOSE);
   
   //Copy price info into the array
   CopyBuffer(BollingerBandsDefiniition, 1, 0, 3, UpperBandArray);
   CopyBuffer(BollingerBandsDefiniition, 0, 0, 3, MiddleBandArray);
   CopyBuffer(BollingerBandsDefiniition, 2, 0, 3, LowerBandArray);
   
   //Calculate EA for the current candle
   double UpperBandValue = UpperBandArray[0];
   double MiddleBandValue = MiddleBandArray[0];
   double LowerBandValue = LowerBandArray[0];
   
   //Chart output of the current EA
   Comment("Upper Bollinger Band Value: ", UpperBandValue, "\n\nMiddle Bollinger Band Value: ", 
   MiddleBandValue, "\n\nLower Band Value: ", LowerBandValue);
      
}