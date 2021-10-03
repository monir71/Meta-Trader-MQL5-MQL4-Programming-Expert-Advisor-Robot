void OnTick()
{
   //Create a price array
   double myPriceArray[];
   
   //Define the properties of the Momentum EA
   double iMomentumDefinition = iMomentum(_Symbol, _Period, 14, PRICE_CLOSE);
   
   //Sort the price array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   //Defined Momentum, 1 line, current candle, 3 cnadles, strore in array
   CopyBuffer(iMomentumDefinition, 0, 0, 3, myPriceArray);
   
   //Get the value of the current candle
   double myMomentumValue = NormalizeDouble(myPriceArray[0], _Digits);
   
   //Chart output depending on the value
   if(myMomentumValue > 100.0) Comment("STRONG MOMENTUM: ", myMomentumValue);
   if(myMomentumValue < 99.9) Comment("WEAK MOMENTUM: ", myMomentumValue);
   if(myMomentumValue <100.0 && myMomentumValue > 99.9) Comment("", myMomentumValue);
}