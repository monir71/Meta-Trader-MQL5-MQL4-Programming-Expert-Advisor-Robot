#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   Trade_On_EA_MA_Cross_Over();
   Comment("Total Positions: ", PositionsTotal());
}

string EA_MA_Cross_Over(int smallMA, int bigMA)
{
   string signal = "";
   
   double smallMA_Array[], bigMA_Array[];
   ArraySetAsSeries(smallMA_Array, true);
   ArraySetAsSeries(bigMA_Array, true);
   
   int smallMA_Handler = iMA(_Symbol, _Period, smallMA, 0, MODE_SMA, PRICE_CLOSE);
   int bigMA_Handler = iMA(_Symbol, _Period, bigMA, 0, MODE_SMA, PRICE_CLOSE);
   
   CopyBuffer(smallMA_Handler, 0, 0, 3, smallMA_Array);
   CopyBuffer(bigMA_Handler, 0, 0, 3, bigMA_Array);
   
   if(bigMA_Array[1] > smallMA_Array[1] && bigMA_Array[2] < smallMA_Array[2])
      signal = "Buy";
   if(bigMA_Array[1] < smallMA_Array[1] && bigMA_Array[2] > smallMA_Array[2])
      signal = "Sell";
      
   return signal;         
}

void Trade_On_EA_MA_Cross_Over()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(EA_MA_Cross_Over(20, 50) == "Buy" && PositionsTotal() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + 300 * _Point, NULL);
   if(EA_MA_Cross_Over(20, 50) == "Sell" && PositionsTotal() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - 300 * _Point, NULL);
}