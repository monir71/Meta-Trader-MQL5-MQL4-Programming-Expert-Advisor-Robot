#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   TradeNowOn_FractalAdaptiveMovingAverage();
   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
      "\nTotal Positions : ", PositionsTotal()
   );
}

void TradeNowOn_FractalAdaptiveMovingAverage()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(CheckEntry_FractalAdaptiveMovingAverage() == "Buy" && GetPositions_Buy() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + (100 * _Point), NULL);
   if(CheckEntry_FractalAdaptiveMovingAverage() == "Sell" && GetPositions_Sell() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - (100 * _Point), NULL); 
}

string CheckEntry_FractalAdaptiveMovingAverage()
{
   string Signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double FractalAdaptiveMovingAverageArray[];
   int FractalAdaptiveMovingAverageHandler = iFrAMA(_Symbol, _Period, 14, 0, PRICE_CLOSE);
   ArraySetAsSeries(FractalAdaptiveMovingAverageArray, true);
   CopyBuffer(FractalAdaptiveMovingAverageHandler, 0, 0, 3, FractalAdaptiveMovingAverageArray);
   double FractalAdaptiveMovingAverageValue = FractalAdaptiveMovingAverageArray[0];
   
   if(FractalAdaptiveMovingAverageValue > priceInformation[1].high)
      Signal = "Buy";
   if(FractalAdaptiveMovingAverageValue < priceInformation[1].low)
      Signal = "Sell";
   
   return Signal;
}

int GetPositions_Buy()
{
   int numberOfBuyPositions = 0;
   
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      string positionSymbol = PositionGetSymbol(i);
      int positionDirection = PositionGetInteger(POSITION_TYPE);
      
      if(positionSymbol == Symbol())
      {
         if(positionDirection == POSITION_TYPE_BUY)
         {
            numberOfBuyPositions++;
         }      
      }
   }
   return numberOfBuyPositions;
}

int GetPositions_Sell()
{
   int numberOfSellPositions = 0;
   
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      string positionSymbol = PositionGetSymbol(i);
      int positionDirection = PositionGetInteger(POSITION_TYPE);
      
      if(positionSymbol == Symbol())
      {
         if(positionDirection == POSITION_TYPE_SELL)
         {
            numberOfSellPositions++;
         }
      }
   }
   return numberOfSellPositions;
}

void CloseAllPositions()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      int ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}