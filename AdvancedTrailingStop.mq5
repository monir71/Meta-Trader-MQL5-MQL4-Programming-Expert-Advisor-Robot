#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   //Get the Ask Price
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   //If we have less than two positions
   if(PositionsTotal() < 2)
   {
      //Open two test Buy positions
      trade.Buy(0.01, NULL, Ask, Ask - 1000 * _Point, Ask + 500 * _Point, NULL);
   }
   
   //Call the trailing stop module
   CheckTrailingStop(Ask);
}

void CheckTrailingStop(double Ask)
{
   //Set the desired stop loss to 150 points
   double SL = NormalizeDouble(Ask - 150 * _Point, _Digits);
   
   //Check all open positions for the current symbol
   for(int i = PositionsTotal(); i >= 0; i--)
   {
      //Get position symbol
      string Symbol = PositionGetSymbol(i);
      
      //If chart symbol equals position symbol
      if(_Symbol == Symbol)
      {
         //Get the Ticket Number
         ulong PositionTicket = PositionGetInteger(POSITION_TICKET);
         
         //Get the current stop loss
         double CurrentStopLoss = PositionGetDouble(POSITION_SL);
         
         //If the current stop loss price is below 150 points from the Ask price
         if(CurrentStopLoss < SL)
         {
            //Modify the stop loss by 10 points
            trade.PositionModify(PositionTicket, CurrentStopLoss + 10 * _Point, 0);
         } 
      }     
   }
}