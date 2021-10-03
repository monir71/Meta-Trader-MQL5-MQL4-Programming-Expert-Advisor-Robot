#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   while(GetRVISignal() == "Buy" && PositionsTotal() < 10)
   {
      trade.Buy(0.01, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   }
   
   while(GetRVISignal() == "Sell" && PositionsTotal() < 10)
   {
      trade.Sell(0.01, NULL, Bid, 0, Bid - (300 * _Point), NULL);
   }
}

string GetRVISignal()
{
   string signal = "";
   
   double RVIarray0[];
   double RVIarray1[];
   
   int RVIHandler = iRVI(_Symbol, _Period, 10);
   
   ArraySetAsSeries(RVIarray0, true);
   ArraySetAsSeries(RVIarray1, true);
   
   CopyBuffer(RVIHandler, 0, 0, 3, RVIarray0);
   CopyBuffer(RVIHandler, 1, 0, 3, RVIarray1);
   
   double RVIvalue0 = NormalizeDouble(RVIarray0[0], 3);
   double RVIvalue1 = NormalizeDouble(RVIarray1[0], 3);
   
   if(RVIvalue0 < RVIvalue1 && RVIvalue0 < 0 && RVIvalue1 < 0)
   {
      signal = "Buy";
   }
   
   if(RVIvalue0 > RVIvalue1 && RVIvalue0 > 0 && RVIvalue1 > 0)
   {
      signal = "Sell";
   }
   
   return signal;
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