#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   TradeNowOnAccumulationDistribution();
   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
      "\nTotal Positions : ", PositionsTotal()
   );
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

void TradeNowOnAccumulationDistribution()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Check_Momentum_Entry() == "Buy" && GetPositions_Buy() < 100 && GetAccumulationDistributionSignal() == "Buy")
   {
      //For H1
      //trade.Buy(0.01, NULL, Ask, 0, Ask + 500 * _Point, NULL);
      //For M1
      trade.Buy(0.01, NULL, Ask, 0, Ask + 300 * _Point, NULL);
   }
   
   if(Check_Momentum_Entry() == "Sell" && GetPositions_Sell() < 100 && GetAccumulationDistributionSignal() == "Sell")
   {
      //For H1
      //trade.Sell(0.01, NULL, Bid, 0, Bid - 500 * _Point, NULL);
      //For M1
      trade.Sell(0.01, NULL, Bid, 0, Bid - 300 * _Point, NULL);
   }
}

void CloseAllPositions()
{
   for(int i = PositionsTotal() -1; i >= 0; i--)
   {
      int ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
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

string GetAccumulationDistributionSignal()
{
   double AccumulationDistributionArray[];   
   int AccumulationDistributionHandler = iAD(_Symbol, _Period, VOLUME_TICK);   
   ArraySetAsSeries(AccumulationDistributionArray, true);   
   CopyBuffer(AccumulationDistributionHandler, 0, 0, 3, AccumulationDistributionArray);
   
   string Signal = "";
   
   if(AccumulationDistributionArray[0] > 0)
      Signal = "Sell";
         
   if(AccumulationDistributionArray[0] < 0)
      Signal = "Buy";
         
   return Signal;
}