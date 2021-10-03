#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(CheckEntry_WPR() == "Buy" && GetPositions_Buy() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + 100 * _Point, NULL);
   if(CheckEntry_WPR() == "Sell" && GetPositions_Sell() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - 100 * _Point, NULL);
}

string CheckEntry_WPR()
{
   string Signal = "";
   
   double WPRarray[];
   
   int WPRdefinition = iWPR(_Symbol, _Period, 14);
   
   ArraySetAsSeries(WPRarray, true);
   
   CopyBuffer(WPRdefinition, 0, 0, 3, WPRarray);
   
   double WPRvalue = NormalizeDouble(WPRarray[0], 2);
   
   if(WPRvalue < -80.00 && WPRvalue > -100.00)
   {
      Signal = "Buy";
   }
   
   if(WPRvalue > -20.00 && WPRvalue < 0)
   {
      Signal = "Sell";
   }
   
   return Signal;
}

int GetPositions_Sell()
{
   int numberOfSellPositions = 0;
   
   for(int i = PositionsTotal() -1; i >= 0; i--)
   {
      string CurrencyPair = PositionGetSymbol(i);
      
      int PositionDirection = PositionGetInteger(POSITION_TYPE);
      
      if(Symbol() == CurrencyPair)
      {
         if(PositionDirection == POSITION_TYPE_SELL)
         {
            numberOfSellPositions = numberOfSellPositions + 1;
         }         
      }
   }
   
   return numberOfSellPositions;
}

int GetPositions_Buy()
{
   int numberOfBuyPositions = 0;
   
   for(int i = PositionsTotal() -1; i >= 0; i--)
   {
      string CurrencyPair = PositionGetSymbol(i);
      
      int PositionDirection = PositionGetInteger(POSITION_TYPE);
      
      if(Symbol() == CurrencyPair)
      {
         if(PositionDirection == POSITION_TYPE_BUY)
         {
            numberOfBuyPositions = numberOfBuyPositions + 1;
         }         
      }
   }
   
   return numberOfBuyPositions;
}