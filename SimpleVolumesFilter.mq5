#include<Trade\Trade.mqh>
CTrade trade;

#include "CheckFilter_Volumes.mq5";
#include "CheckSignal_BollingerBands.mq5";

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(CheckSignal_BollinngerBands() == "Buy" && GetPositions_Buy() < 10 && CheckFilter_Volumes() == "Positive")
   {
      //For H1
      trade.Buy(0.01, NULL, Ask, 0, Ask + 500 * _Point, NULL);
      //For M1
      //trade.Buy(0.01, NULL, Ask, 0, Ask + 100 * _Point, NULL);
   }
   
   if(CheckSignal_BollinngerBands() == "Sell" && GetPositions_Sell() < 10 && CheckFilter_Volumes() == "Positive")
   {
      //For H1
      trade.Sell(0.01, NULL, Bid, 0, Bid - 500 * _Point, NULL);
      //For M1
      //trade.Sell(0.01, NULL, Bid, 0, Bid - 100 * _Point, NULL);
   }

   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
      "\nTotal Positions : ", PositionsTotal()
   );
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