#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Check_Entry_RSI() == "Buy" && GetPositions_Buy() < 100)
      trade.Buy(0.01, _Symbol, Ask, 0, Ask + (100 * _Point), NULL);
   if(Check_Entry_RSI() == "Sell" && GetPositions_Sell() < 100)
      trade.Sell(0.01, _Symbol, Bid, 0, Bid - (100 * _Point), NULL);
   
   Comment("Buy : ", GetPositions_Buy(), "\nSell: ", GetPositions_Sell());      
}

string Check_Entry_RSI()
{
   string Signal = "";

   double RSIArray[];
   
   int RSIDefinition = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
   
   ArraySetAsSeries(RSIArray, true);
   
   CopyBuffer(RSIDefinition, 0, 0, 3, RSIArray);
   
   double RSIValue = NormalizeDouble(RSIArray[0], 2);
   
   if(RSIValue > 70.00)
      Signal = "Sell";
   if(RSIValue < 30.00)
      Signal = "Buy";
      
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