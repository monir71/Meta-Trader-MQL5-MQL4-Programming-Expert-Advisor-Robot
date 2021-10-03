#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double SARArray[];
   int SARDefinition = iSAR(_Symbol, _Period, 0.02, 0.2);
   ArraySetAsSeries(SARArray, true);
   CopyBuffer(SARDefinition, 0, 0, 3, SARArray);
   
   double lastSARValue = NormalizeDouble(SARArray[1], 5);
   double nextToLastSARValue = NormalizeDouble(SARArray[2], 5);
   
   string Signal = "";
   
   if(lastSARValue > priceInformation[1].high)
      if(nextToLastSARValue < priceInformation[2].low)
         Signal = "Sell";

   if(lastSARValue < priceInformation[1].low)
      if(nextToLastSARValue > priceInformation[2].high)
         Signal = "Buy";
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Signal == "Buy")
      trade.Buy(0.10, NULL, Ask, 0, Ask + 100 * _Point, NULL);

   if(Signal == "Sell")
      trade.Sell(0.10, NULL, Bid, 0, Bid - 100 * _Point, NULL);            
   
}