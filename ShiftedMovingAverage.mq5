#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   while(GetShiftedMovingAverageSignal() == "Buy")
      trade.Buy(0.01, NULL, Ask, 0, Ask + 200 * _Point, NULL);
   while(GetShiftedMovingAverageSignal() == "Sell")
      trade.Sell(0.01, NULL, Bid, 0, Bid - 200 * _Point, NULL);
         
}

string GetShiftedMovingAverageSignal()
{
   string signal = "";
   
   double movingAverageArray[], shiftedMovingAverageArray[];
   ArraySetAsSeries(movingAverageArray, true);
   ArraySetAsSeries(shiftedMovingAverageArray, true);
   int movingAverageHandler = iMA(_Symbol, _Period, 50, 0, MODE_SMA, PRICE_CLOSE);
   int shiftedMovingAverageHandler = iMA(_Symbol, _Period, 51, 20, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(movingAverageHandler, 0, 0, 3, movingAverageArray);
   CopyBuffer(shiftedMovingAverageHandler, 0, 0, 3, shiftedMovingAverageArray);
   double movingAverageValue = movingAverageArray[0];
   double shiftedMovingAverageValue = shiftedMovingAverageArray[0];
   
   MqlRates PriceInfo[];
   ArraySetAsSeries(PriceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, PriceInfo);
   
   if(PriceInfo[1].close > shiftedMovingAverageValue && PriceInfo[2].close < shiftedMovingAverageValue)
      signal = "Buy";
   if(PriceInfo[1].close < shiftedMovingAverageValue && PriceInfo[2].close > shiftedMovingAverageValue)
      signal = "Sell";
   
   return signal;      
}

string GetSignal_BollinngerBands()
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

string GetEntry_AwesomeOscillator()
{
   string signal = "";
   
   double priceArray[];
   ArraySetAsSeries(priceArray, true);
   int AOHandler = iAO(_Symbol, _Period);
   CopyBuffer(AOHandler, 0, 0, 3, priceArray);
   double AwesomeOscillatorValue = NormalizeDouble(priceArray[0], 6);
   
   if(AwesomeOscillatorValue > 0)
      signal = "Buy";
   if(AwesomeOscillatorValue < 0)
      signal = "Sell";
      
   return signal;
}

string Check_Momentum_Entry()
{
   string Signal = "";
   
   double priceInformation[];
   
   int MomentumDefinition = iMomentum(_Symbol, _Period, 14, PRICE_CLOSE);
   
   ArraySetAsSeries(priceInformation, true);
   
   CopyBuffer(MomentumDefinition, 0, 0, 3, priceInformation);
   
   double MomentumValue = NormalizeDouble(priceInformation[0], 2);
   
   if(MomentumValue > 100.00)//Over Bought
   {
      Signal = "Sell";
   }
   
   if(MomentumValue < 100.00)//Over Sold
   {
      Signal = "Buy";
   }
   
   return Signal;
}