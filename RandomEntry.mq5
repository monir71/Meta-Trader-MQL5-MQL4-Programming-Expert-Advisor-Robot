#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   string Signal = "";
   
   MathSrand(GetTickCount());
   
   double randomNumber = MathRand() % 2;
   
   if(randomNumber == 0)
      Signal = "Buy";
   if(randomNumber == 1)
      Signal = "Sell";
      
   Comment("Signal = ", Signal, "\nBuy = ", GetPositions_Buy(), "\nSell = ", GetPositions_Sell());
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Signal == "Buy" && GetPositions_Buy() < 50)
   {
      for(int i = 50 - GetPositions_Buy(); i >= 1; i--)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (50 * _Point), NULL);
      }
   }
      
   if(Signal == "Sell" && GetPositions_Sell() < 50)
   {
      for(int i = 50 - GetPositions_Sell(); i >= 1; i--)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (50 * _Point), NULL);
      }
   }
      
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