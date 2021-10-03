#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   while(GetEntryBollingerBandsStandalone() == "Buy" && GetPositions_Buy() < 100)
   {
      trade.Buy(0.01, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   }
   
   while(GetEntryBollingerBandsStandalone() == "Sell" && GetPositions_Sell() < 100)
   {
      trade.Sell(0.01, NULL, Bid, 0, Bid - (300 * _Point), NULL);
   }
   
   WriteComment();
}

string GetEntryBollingerBandsStandalone()
{
   string signal = "";
   
   double lowerBandArray[];
   double upperBandArray[];
   
   int BollingerBandsHandler = iBands(_Symbol, _Period, 20, 0, 2, PRICE_CLOSE);
   
   ArraySetAsSeries(lowerBandArray, true);
   ArraySetAsSeries(upperBandArray, true);
   
   CopyBuffer(BollingerBandsHandler, 2, 0, 3, lowerBandArray);
   CopyBuffer(BollingerBandsHandler, 1, 0, 3, upperBandArray);
   
   double upperBandValue = upperBandArray[0];
   double lowerBandValue = lowerBandArray[0];
   
   double upperBandValueLastButOne = upperBandArray[1];
   double lowerBandValueLastButOne = lowerBandArray[1];
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int priceData = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   if(priceInformation[0].close > lowerBandValue && priceInformation[1].close < lowerBandValueLastButOne)
      signal = "Buy";
   if(priceInformation[0].close < upperBandValue && priceInformation[1].close > upperBandValueLastButOne)
      signal = "Sell";
   
   return signal;   
}

void WriteComment()
{
   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
      "\nTotal Positions : ", PositionsTotal(),
      "\nSignal : ", GetEntryBollingerBandsStandalone()
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