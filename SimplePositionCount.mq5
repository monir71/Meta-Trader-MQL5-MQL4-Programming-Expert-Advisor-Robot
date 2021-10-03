#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
  {
      int PositionsForThisSymbol = 0;
      
      for(int i = PositionsTotal() - 1; i >= 0; i--)
        {
            string symbol = PositionGetSymbol(i);
            
            if(Symbol() == symbol)
              {
                  PositionsForThisSymbol += 1;
              }
        }
        
        Comment("\n\nPositions for this currency pair:", PositionsForThisSymbol);
        
  }