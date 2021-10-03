#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   double profit = AccountInfoDouble(ACCOUNT_PROFIT);
   string method = "";
   
   if(profit < -1000)
   {
      TradeNowOnMomentum();
      method = "Momentum Trading...";
   }
   else
   {
      TradeOnCommodityChannelIndex();
      method = "CCI Trading...";
   }

   Comment(
      "\nTotal Buy Positions : ", GetPositions_Buy(),
      "\nTotal Sell Positions : ", GetPositions_Sell(),
      "\nAccount Balance : ", balance,
      "\nAccount Equity : ", equity,
      "\nAccount Profit : ", profit,
      "\nTotal Positions : ", PositionsTotal(),
      "\nAction : ", method
      
   );
}

void TradeOnCommodityChannelIndex()
{
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(Get_CommodityChannelIndex_Signal() == "Buy" && GetPositions_Buy() < 50)
   {
      trade.Buy(0.01, NULL, Ask, 0, Ask + (500 * _Point), NULL);
   }
   
   if(Get_CommodityChannelIndex_Signal() == "Sell" && GetPositions_Sell() < 50)
   {
      trade.Sell(0.01, NULL, Bid, 0, Bid - (500 * _Point), NULL);
   }
}

string Get_CommodityChannelIndex_Signal()
{
   string Signal = "";
   
   double CommodityChannelIndexArray[];
   int CommodityChannelIndexHandler = iCCI(_Symbol, _Period, 32, PRICE_TYPICAL);
   ArraySetAsSeries(CommodityChannelIndexArray, true);
   CopyBuffer(CommodityChannelIndexHandler, 0, 0, 3, CommodityChannelIndexArray);
   float CommodityChannelIndexValue = CommodityChannelIndexArray[0];
   
   if(CommodityChannelIndexValue > 200)
      Signal = "Sell";
   if(CommodityChannelIndexValue < -200)
      Signal = "Buy";
      
   return Signal;
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
      trade.Buy(0.01, NULL, Ask, 0, Ask + 300 * _Point, NULL);
   }
   
   if(Check_Momentum_Entry() == "Sell" && GetPositions_Sell() < 100 && GetTripleMovingAverageSignal() == "Sell Now!")
   {
      trade.Sell(0.01, NULL, Bid, 0, Bid - 300 * _Point, NULL);
   }
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