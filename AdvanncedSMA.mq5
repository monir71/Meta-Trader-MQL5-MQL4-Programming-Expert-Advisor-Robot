#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Check_Entry_SMA() == "Buy" && GetPositions_Buy() < 100)
      trade.Buy(0.01, _Symbol, Ask, 0, Ask + (100 * _Point), NULL);
   if(Check_Entry_SMA() == "Sell" && GetPositions_Sell() < 100)
      trade.Sell(0.01, _Symbol, Bid, 0, Bid - (100 * _Point), NULL);
   
   Comment("Buy : ", GetPositions_Buy(), "\nSell: ", GetPositions_Sell());      
}

string Check_Entry_SMA()
{
   string Signal = "";

   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double SMAArray[];
   int SMADefinition = iMA(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE);
   ArraySetAsSeries(SMAArray, true);
   CopyBuffer(SMADefinition, 0, 0, 3, SMAArray);
   
   if(priceInformation[1].close > SMAArray[1] && priceInformation[2].close < SMAArray[2])
      Signal = "Buy";
   if(priceInformation[1].close < SMAArray[1] && priceInformation[2].close > SMAArray[2])
      Signal = "Sell";
      
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