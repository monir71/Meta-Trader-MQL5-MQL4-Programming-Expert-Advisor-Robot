#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double BullsPowerValueArray[];
   ArraySetAsSeries(BullsPowerValueArray, true);
   int BullsPowerHanndler = iBullsPower(_Symbol, _Period, 13);
   CopyBuffer(BullsPowerHanndler, 0, 0, 3, BullsPowerValueArray);
   double BullsPowerValue = BullsPowerValueArray[0];
   
  double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
  double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
  
  if(BullsPowerValue > 0)
      trade.Buy(0.10, NULL, Ask, 0, Ask + 300 * _Point, NULL);
  if(BullsPowerValue < 0)
      trade.Sell(0.10, NULL, Bid, 0, Bid - 300 * _Point, NULL);
      
  Comment("Bulls Power : ", BullsPowerValue, "\nPositions : ", PositionsTotal());
  
}