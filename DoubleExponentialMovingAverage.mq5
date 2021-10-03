#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double DoubleExponentialMovingAverageArray[];
   int DoubleExponentialMovingAverageHandler = iDEMA(_Symbol, _Period, 14, 0, PRICE_CLOSE);
   ArraySetAsSeries(DoubleExponentialMovingAverageArray, true);
   CopyBuffer(DoubleExponentialMovingAverageHandler, 0, 0, 3, DoubleExponentialMovingAverageArray);
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   double DoubleExponentialMovingAverageValue = DoubleExponentialMovingAverageArray[1];
   
   if(DoubleExponentialMovingAverageValue < priceInformation[1].close && GetPositions_Buy() < 50)
      trade.Buy(0.01, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   
   if(DoubleExponentialMovingAverageValue > priceInformation[1].close && GetPositions_Sell() < 50)
      trade.Sell(0.01, NULL, Bid, 0, Bid - (300 * _Point), NULL);
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