void OnTick()
{
   //create an array for several prices
  double myRSIarray[];
  
  //Define the properties of the RSI
  int myRSIdefinition = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
  
  //sort the price array from the current candle downwards
  ArraySetAsSeries(myRSIarray, true);
  
  //Defined EA, current candle, 3 candles, store result
  CopyBuffer(myRSIdefinition, 0, 0, 3, myRSIarray);
  
  //calculate EA for the current candle
  double myRSIvalue = NormalizeDouble(myRSIarray[0], 2);
  
  //Chart output of the current EA
  Comment("RSI Value: ", myRSIvalue);
}