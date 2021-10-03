#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double LowerBandArray[];
   ArraySetAsSeries(LowerBandArray, true);
   int BollingerBandDefinition = iBands(_Symbol, _Period, 20, 0, 2, PRICE_CLOSE);
   CopyBuffer(BollingerBandDefinition, 2, 0, 3, LowerBandArray);
   double LowerBandValue = LowerBandArray[0];
   Comment("Lover Band Value: ", LowerBandValue);
   
   double myRSIArray[];
   ArraySetAsSeries(myRSIArray, true);
   int myRSIDefinition = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
   CopyBuffer(myRSIDefinition, 0, 0, 3, myRSIArray);
   double myRSIValue = NormalizeDouble(myRSIArray[0], 2);
   Comment("\n\nMy RSI Value: ", myRSIValue);
   
   Comment("");
   
   double Ask =NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   if(LowerBandValue < 30 && myRSIValue < 30)
   {
      Comment("\nLower Band: ", LowerBandValue, " and RSI : ", myRSIValue, "\nBUY BUY BUY !!!");
      trade.Buy(0.10, NULL, Ask, 0, (Ask + 100 * _Point), NULL);
   }
   
}