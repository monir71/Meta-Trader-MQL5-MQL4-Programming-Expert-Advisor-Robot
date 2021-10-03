#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   TradeOnnTripleExponentialMovingAverage();
   
   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
      "\nTotal Positions : ", PositionsTotal()
   );
}

void TradeOnnTripleExponentialMovingAverage()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(CheckEntry_TripleExponentialMovingAverage() == "Buy" && GetPositions_Buy() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   if(CheckEntry_TripleExponentialMovingAverage() == "Sell" && GetPositions_Sell() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - (300 * _Point), NULL);      
}

string CheckEntry_TripleExponentialMovingAverage()
{
   string Signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double TripleExponentialMovingAverageArray[];
   int TripleExponentialMovingAverageHandler = iTEMA(_Symbol, _Period, 14, 0, PRICE_CLOSE);
   ArraySetAsSeries(TripleExponentialMovingAverageArray, true);
   CopyBuffer(TripleExponentialMovingAverageHandler, 0, 0, 3, TripleExponentialMovingAverageArray);
   double TripleExponentialMovingAverageValue = NormalizeDouble(TripleExponentialMovingAverageArray[0], 2);
   
   if(TripleExponentialMovingAverageValue > priceInformation[1].close)
      Signal = "Sell";
   if(TripleExponentialMovingAverageValue < priceInformation[1].close)
      Signal = "Buy";
      
   return Signal;
}

int GetPositions_Buy()
{
   int numberOfPositionsBuy = 0;
   
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      string currenyPair = PositionGetSymbol(i);
      int PositionDirection = PositionGetInteger(POSITION_TYPE);
      if(currenyPair == _Symbol)
         if(PositionDirection == POSITION_TYPE_BUY)
            numberOfPositionsBuy++;      
   }
   return numberOfPositionsBuy;
}

int GetPositions_Sell()
{
   int numberOfPositionsSell = 0;
   
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      string currencyPair = PositionGetSymbol(i);
      int PositionDirection = PositionGetInteger(POSITION_TYPE);
      
      if(currencyPair == _Symbol)
         if(PositionDirection == POSITION_TYPE_SELL)
            numberOfPositionsSell++;      
   }
   return numberOfPositionsSell;
}

void CloseAllPositions()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}