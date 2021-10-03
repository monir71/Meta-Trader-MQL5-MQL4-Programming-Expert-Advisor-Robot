#include<Trade\Trade.mqh>
CTrade trade;

||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||                                    ||||||||||||||||||
||||||||||||        NOT  CLEAR!                 ||||||||||||||||||
||||||||||||                                    ||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

input double filter = 0.0001;

void OnTick()
{
   double MovingAverageArray[];
   
   int MovingAverageHandler = iMA(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE);
   
   ArraySetAsSeries(MovingAverageArray, true);
   
   CopyBuffer(MovingAverageHandler, 0, 0, 10, MovingAverageArray);
   
   double MovingAverageValue = MovingAverageArray[0] - MovingAverageArray[9];
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(MovingAverageValue > filter && PositionsTotal() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + 500 * _Point, NULL);
      
   if(MovingAverageValue > (filter * -1) && PositionsTotal() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - 500 * _Point, NULL);
      
   Comment("Value: ", MovingAverageValue, "\nFilter : ", filter);
}