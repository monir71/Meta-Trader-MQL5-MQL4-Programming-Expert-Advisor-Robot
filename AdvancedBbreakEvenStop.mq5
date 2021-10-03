#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   if(PositionsTotal() < 12)
      trade.Buy(0.10, NULL, Ask, Ask - 300 * _Point, Ask + 300 * _Point, NULL);

   CheckBreakEventStop(Ask);
}

void CheckBreakEventStop(double Ask)
{
   for(int i=PositionsTotal(); i>0; i--)
   {
      string Symbol = PositionGetSymbol(i);
      
      if(_Symbol == Symbol)
      {
         //Get the ticket number
         ulong PositionTicket = PositionGetInteger(POSITION_TICKET);
         //Get the position buy price
         double PositionBuyPrice = PositionGetDouble(POSITION_PRICE_OPEN);;
         
         if(Ask > PositionBuyPrice + 100 * _Point)
         {
            //Modify the stop loss
            trade.PositionModify(PositionTicket, PositionBuyPrice, 0);
         } 
      }
   }
}