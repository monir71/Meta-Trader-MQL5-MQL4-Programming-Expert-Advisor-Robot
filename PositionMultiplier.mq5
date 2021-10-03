#include<Trade\Trade.mqh>
CTrade trade;

input int Number_Of_Positions = 1;

void OnTick()
{
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   if(priceInformation[1].close > priceInformation[2].close)
   {
      if(PositionsTotal() < Number_Of_Positions)
      {
         for(int i = Number_Of_Positions - PositionsTotal(); i > 0; i--)
         {
            trade.Buy(0.01, NULL, Ask, 0, Ask + (300 * _Point), NULL);
         }
      }
   }
 
}