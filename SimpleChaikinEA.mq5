#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Check_Entry_Chaikin() == "Buy" && GetPositions_Buy() < 100 && Check_Momentum_Entry() == "Buy")
      trade.Buy(0.01, _Symbol, Ask, 0, Ask + (500 * _Point), NULL);
   if(Check_Entry_Chaikin() == "Sell" && GetPositions_Sell() < 100 && Check_Momentum_Entry() == "Sell")
      trade.Sell(0.01, _Symbol, Bid, 0, Bid - (500 * _Point), NULL);
   
   Comment("Buy : ", GetPositions_Buy(), "\nSell: ", GetPositions_Sell());      
}

string Check_Entry_Chaikin()
{
   string Signal = "";

   double ChaikinArray[];
   int ChaikinDefinition = iChaikin(_Symbol, _Period, 3, 10, MODE_EMA, VOLUME_TICK);
   ArraySetAsSeries(ChaikinArray, true);
   CopyBuffer(ChaikinDefinition, 0, 0, 3, ChaikinArray);
   
   double chaikinValue = ChaikinArray[0];
   double previousChaikinValue = ChaikinArray[1];
   
   if(chaikinValue > 10 && previousChaikinValue < 10)
      Signal = "Sell";
   if(chaikinValue < -10 && previousChaikinValue > -10)
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

string Check_Momentum_Entry()
{
   string Signal = "";
   
   double priceInformation[];
   
   int MomentumDefinition = iMomentum(_Symbol, _Period, 14, PRICE_CLOSE);
   
   ArraySetAsSeries(priceInformation, true);
   
   CopyBuffer(MomentumDefinition, 0, 0, 3, priceInformation);
   
   double MomentumValue = NormalizeDouble(priceInformation[0], 2);
   
   if(MomentumValue > 100.00)//Over Bought
   {
      Signal = "Sell";
   }
   
   if(MomentumValue < 100.00)//Over Sold
   {
      Signal = "Buy";
   }
   
   return Signal;
}