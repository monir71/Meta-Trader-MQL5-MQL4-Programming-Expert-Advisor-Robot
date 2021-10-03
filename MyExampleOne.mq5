#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   while(GetPositions_Buy() < 10 && GetSignal() == "Buy")
   {
      trade.Buy(0.10, NULL, Ask, Ask - (200 * _Point), Ask + (300 * _Point), NULL);
   }
   
   while(GetPositions_Sell() < 10 && GetSignal() == "Sell")
   {
      trade.Sell(0.10, NULL, Bid, Bid + (200 * _Point), Bid - (300 * _Point), NULL);
   }
}

string GetSignal()
{
   string signal = "";
   
   double myMovingAverageArray4[];
   double myMovingAverageArray6[];
   double myMovingAverageArray5[];
   double myMovingAverageArray1[];
   double myMovingAverageArray2[];
   double myMovingAverageArray3[];
   
   int myMovingAverageArray4Definition = iMA(_Symbol, _Period, 84, 0, MODE_EMA, PRICE_CLOSE);
   int myMovingAverageArray6Definition = iMA(_Symbol, _Period, 78, 0, MODE_EMA, PRICE_CLOSE);
   int myMovingAverageArray5Definition = iMA(_Symbol, _Period, 40, 0, MODE_EMA, PRICE_CLOSE);
   int myMovingAverageArray1Definition = iMA(_Symbol, _Period, 9, 0, MODE_EMA, PRICE_CLOSE);
   int myMovingAverageArray2Definition = iMA(_Symbol, _Period, 8, 0, MODE_EMA, PRICE_CLOSE);
   int myMovingAverageArray3Definition = iMA(_Symbol, _Period, 3, 0, MODE_EMA, PRICE_CLOSE);
   //0 1 2 3 5 8 13 21
   ArraySetAsSeries(myMovingAverageArray4, true);
   ArraySetAsSeries(myMovingAverageArray6, true);
   ArraySetAsSeries(myMovingAverageArray5, true);
   ArraySetAsSeries(myMovingAverageArray1, true);
   ArraySetAsSeries(myMovingAverageArray2, true);
   ArraySetAsSeries(myMovingAverageArray3, true);
   
   CopyBuffer(myMovingAverageArray4Definition, 0, 0, 3, myMovingAverageArray4);
   CopyBuffer(myMovingAverageArray6Definition, 0, 0, 3, myMovingAverageArray6);
   CopyBuffer(myMovingAverageArray5Definition, 0, 0, 3, myMovingAverageArray5);
   CopyBuffer(myMovingAverageArray1Definition, 0, 0, 3, myMovingAverageArray1);
   CopyBuffer(myMovingAverageArray2Definition, 0, 0, 3, myMovingAverageArray2);
   CopyBuffer(myMovingAverageArray3Definition, 0, 0, 3, myMovingAverageArray3);
   
   if(myMovingAverageArray4[0] > myMovingAverageArray6[0] &&
         myMovingAverageArray6[0] > myMovingAverageArray5[0] &&
            myMovingAverageArray5[0] > myMovingAverageArray1[0] &&
               myMovingAverageArray1[0] > myMovingAverageArray2[0] &&
                  myMovingAverageArray2[0] > myMovingAverageArray3[0])
   {
      signal = "Sell";
   }
   
   if(myMovingAverageArray4[0] < myMovingAverageArray6[0] &&
         myMovingAverageArray6[0] < myMovingAverageArray5[0] &&
            myMovingAverageArray5[0] < myMovingAverageArray1[0] &&
               myMovingAverageArray1[0] < myMovingAverageArray2[0] &&
                  myMovingAverageArray2[0] < myMovingAverageArray3[0])
   {
      signal = "Buy";
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