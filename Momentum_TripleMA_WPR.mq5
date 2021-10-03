#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   TradeNowOnMomentum();
   Comment(GetTripleMovingAverageSignal());
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

void TradeNowOnMomentum()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Check_Momentum_Entry() == "Buy" && GetPositions_Buy() < 100 && GetTripleMovingAverageSignal() == "Buy Now!")
   {
      //For H1
      //trade.Buy(0.01, NULL, Ask, 0, Ask + 500 * _Point, NULL);
      //For M1
      trade.Buy(0.01, NULL, Ask, 0, Ask + 100 * _Point, NULL);
   }
   
   if(Check_Momentum_Entry() == "Sell" && GetPositions_Sell() < 100 && GetTripleMovingAverageSignal() == "Sell Now!")
   {
      //For H1
      //trade.Sell(0.01, NULL, Bid, 0, Bid - 500 * _Point, NULL);
      //For M1
      trade.Sell(0.01, NULL, Bid, 0, Bid - 100 * _Point, NULL);
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

string GetTripleMovingAverageSignal()
{
   double movingAverage100Array[];
   double movingAverage50Array[];
   double movingAverage10Array[];
   
   int movingAverage100Definition = iMA(_Symbol, _Period, 100, 0, MODE_SMA, PRICE_CLOSE);
   int movingAverage50Definition = iMA(_Symbol, _Period, 50, 0, MODE_SMA, PRICE_CLOSE);
   int movingAverage10Definition = iMA(_Symbol, _Period, 10, 0, MODE_SMA, PRICE_CLOSE);
   
   ArraySetAsSeries(movingAverage100Array, true);
   ArraySetAsSeries(movingAverage50Array, true);
   ArraySetAsSeries(movingAverage10Array, true);
   
   CopyBuffer(movingAverage100Definition, 0, 0, 10, movingAverage100Array);
   CopyBuffer(movingAverage50Definition, 0, 0, 10, movingAverage50Array);
   CopyBuffer(movingAverage10Definition, 0, 0, 10, movingAverage10Array);
   
   string Signal = "";
   
   if(movingAverage100Array[0] > movingAverage50Array[0])
      if(movingAverage50Array[0] > movingAverage10Array[0])
         Signal = "Buy Now!";
         
   if(movingAverage100Array[0] < movingAverage50Array[0])
      if(movingAverage50Array[0] < movingAverage10Array[0])
         Signal = "Sell Now!";
         
   return Signal;
}

string CheckEntry_WPR()
{
   string Signal = "";
   
   double WPRarray[];
   
   int WPRdefinition = iWPR(_Symbol, _Period, 14);
   
   ArraySetAsSeries(WPRarray, true);
   
   CopyBuffer(WPRdefinition, 0, 0, 3, WPRarray);
   
   double WPRvalue = NormalizeDouble(WPRarray[0], 2);
   
   if(WPRvalue < -80.00 && WPRvalue > -100.00)
   {
      Signal = "Buy";
   }
   
   if(WPRvalue > -20.00 && WPRvalue < 0)
   {
      Signal = "Sell";
   }
   
   return Signal;
}