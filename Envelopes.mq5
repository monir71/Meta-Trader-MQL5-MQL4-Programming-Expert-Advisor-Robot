#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(CheckEntry_Envelopes() == "Buy" && GetPositions_Buy() < 100)
      trade.Buy(0.01, _Symbol, Ask, 0, Ask + (100 * _Point), NULL);
   if(CheckEntry_Envelopes() == "Sell" && GetPositions_Sell() < 100)
      trade.Sell(0.01, _Symbol, Bid, 0, Bid - (100 * _Point), NULL);
   
   Comment("Buy : ", GetPositions_Buy(), "\nSell: ", GetPositions_Sell());  
}

string CheckEntry_Envelopes()
{
   string Signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double upperBandArray[];
   double lowerBandArray[];
   
   int EnvelopesHandler = iEnvelopes(_Symbol, _Period, 14, 0, MODE_SMA, PRICE_CLOSE, 0.100);
   
   ArraySetAsSeries(upperBandArray, true);
   ArraySetAsSeries(lowerBandArray, true);
   
   CopyBuffer(EnvelopesHandler, 0, 0, 3, upperBandArray);
   CopyBuffer(EnvelopesHandler, 1, 0, 3, lowerBandArray);
   
   double upperBandValue = NormalizeDouble(upperBandArray[0], 6);
   double lowerBandValue = NormalizeDouble(lowerBandArray[0], 6);
   
   if(priceInformation[1].close > upperBandValue)
      Signal = "Sell";
   if(priceInformation[1].close < lowerBandValue)
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