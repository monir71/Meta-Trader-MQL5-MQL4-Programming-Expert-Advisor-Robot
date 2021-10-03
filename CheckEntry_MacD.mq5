#include<Trade\Trade.mqh>
CTrade trade;

string CheckEntryMacD()
{
   string Signal = "";
   
   double priceInformation[];
   
   ArraySetAsSeries(priceInformation, true);
   
   int MacDdefinition = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE);
   
   CopyBuffer(MacDdefinition, 0, 0, 3, priceInformation);
   
   float MacDValue = priceInformation[0];
   
   if(MacDValue < 0)
      Signal = "Buy";
   
   if(MacDValue > 0)
      Signal = "Sell";
      
   return Signal; 
}

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(CheckEntryMacD() == "Buy"  && PositionsTotal() < 100)
   {
      trade.Buy(0.01, NULL, Ask, Ask - 300 * _Point, Ask + 100 * _Point, NULL);
      Comment("Buy Now. Total Positions : ", PositionsTotal());
   }

   if(CheckEntryMacD() == "Sell" && PositionsTotal() < 100)
   {
      trade.Sell(0.01, NULL, Bid, Bid + 300 * _Point, Bid - 100 * _Point, NULL);
      Comment("Sell Now. Total Positions : ", PositionsTotal());
   }
   
   Comment("MacD in Action");
}