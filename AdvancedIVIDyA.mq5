#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
    double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
    double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
    
   if(checkEntry_VariableIndexDynamicAverage() == "Buy" && GetPositions_Buy() < 100  && Check_Momentum_Entry() == "Buy")
      trade.Buy(0.01, NULL, Ask, 0, Ask + (100 * _Point), NULL);
   if(checkEntry_VariableIndexDynamicAverage() == "Sell" && GetPositions_Sell() < 100 && Check_Momentum_Entry() == "Sell")
      trade.Sell(0.01, NULL, Bid, 0, Bid - (100 * _Point), NULL);
   
   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
      "\nTotal Positions : ", PositionsTotal()
   );
}

string checkEntry_VariableIndexDynamicAverage()
{
   string Signal = "";
   MqlRates priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInfo);
   
   double VariableIndexDynamicAverageArray[];
   int VariableIndexDynamicAverageHandler = iVIDyA(_Symbol, _Period, 9, 12, 0, PRICE_CLOSE);
   ArraySetAsSeries(VariableIndexDynamicAverageArray, true);
   CopyBuffer(VariableIndexDynamicAverageHandler, 0, 0, 3, VariableIndexDynamicAverageArray);
   float VariableIndexDynamicAverageValue = VariableIndexDynamicAverageArray[0];
   
   if(VariableIndexDynamicAverageValue > priceInfo[1].close && VariableIndexDynamicAverageValue < priceInfo[2].close)
      Signal = "Sell";
   if(VariableIndexDynamicAverageValue < priceInfo[1].close && VariableIndexDynamicAverageValue > priceInfo[2].close)
      Signal = "Buy";
      
   return Signal;
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