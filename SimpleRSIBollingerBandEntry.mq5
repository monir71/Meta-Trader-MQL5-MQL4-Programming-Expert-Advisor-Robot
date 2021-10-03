#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   //Empty Chart output
   Comment("");
   
   //Create arrays for RSI and 1 Bollinger Band
   double myRSIarray[], lowerBollingerBand[];
   
   //Define RSI settings
   int myRSIDefinition = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
   
   //Sort price data from current candle downwards
   ArraySetAsSeries(myRSIarray, true);
   
   //Define EA, current acndle, 3 candles and save in array
   CopyBuffer(myRSIDefinition, 0, 0, 3, myRSIarray); 
   
   //Calculate RSI Value of the current candle
   double myRSIvalue = NormalizeDouble(myRSIarray[0], 2);
   
   //------------------------------------------------------------------
   
   //Sort current candle downwards
   ArraySetAsSeries(lowerBollingerBand, true);
   
   //Define bollinger band
   int lowerBollingerBandDefinition = iBands(_Symbol, _Period, 20, 0, 2, PRICE_CLOSE);
   
   //Define EA, lower BB Band, current candle, 3 candles and save in array
   CopyBuffer(lowerBollingerBandDefinition, 0, 0, 3, lowerBollingerBand);
   
   //Calculate EA for the last candle
   double lowerBollingerBandValue = lowerBollingerBand[0];
   
   //get the ask price
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   if(myRSIvalue < 30)
      if(Ask < lowerBollingerBandValue)
         Comment("\n\n\n\nOverSold and Below Lower Band");
}