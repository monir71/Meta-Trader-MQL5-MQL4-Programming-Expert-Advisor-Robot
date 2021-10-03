#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   TradeNowOnAdaptiveMovingAverage();
   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
      "\nTotal Positions : ", PositionsTotal()
   );
}


void TradeNowOnAdaptiveMovingAverage()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(GetAdaptiveMovingAverageSignal() == "Buy" && GetPositions_Buy() < 100)
   {
      //For H1
      //trade.Buy(0.01, NULL, Ask, 0, Ask + 500 * _Point, NULL);
      //For M1
      trade.Buy(0.01, NULL, Ask, 0, Ask + 100 * _Point, NULL);
   }
   
   if(GetAdaptiveMovingAverageSignal() == "Sell" && GetPositions_Sell() < 100)
   {
      //For H1
      //trade.Sell(0.01, NULL, Bid, 0, Bid - 500 * _Point, NULL);
      //For M1
      trade.Sell(0.01, NULL, Bid, 0, Bid - 100 * _Point, NULL);
   }
}

void CloseAllPositions()
{
   for(int i = PositionsTotal() -1; i >= 0; i--)
   {
      int ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
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

string GetAdaptiveMovingAverageSignal()
{
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   double AdaptiveMovingAverageArray[];
   int AdaptiveMovingAverageHandler = iAMA(_Symbol, _Period, 9, 2, 30, 0, PRICE_CLOSE);
   ArraySetAsSeries(AdaptiveMovingAverageArray, true);
   CopyBuffer(AdaptiveMovingAverageHandler, 0, 0, 3, AdaptiveMovingAverageArray);
   
   double AdaptiveMovingAverageValue = NormalizeDouble(AdaptiveMovingAverageArray[0], 6);
   
   string Signal = "";
   
   if(AdaptiveMovingAverageValue > priceInformation[0].close)
      Signal = "Sell";
   if(AdaptiveMovingAverageValue < priceInformation[0].close)
      Signal = "Buy";
      
   return Signal;
}