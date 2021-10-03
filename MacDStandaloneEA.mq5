#include<Trade\Trade.mqh>
CTrade trade;

static int sellPositions = 10;
static int buyPositions = 10;
static int accountEquity = 2000;


void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   double priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   
   int MacDHandler = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE);
   CopyBuffer(MacDHandler, 0, 0, 10, priceInfo);
   
   double macdValue = priceInfo[0];
   double macdValueLastButOne = priceInfo[9];
   double macdValueLastButOneCheck = priceInfo[8];
   
   /*
   if(accountEquity < 1000 && GetPositions_Sell() == 10)
   {
      sellPositions = 20;    
   }
   
   if(accountEquity < 1000 && GetPositions_Buy() == 10)
   {
      buyPositions = 20;    
   }
   */
   
   if(GetProfit_Buy() < -1500)
   {
      while(GetPositions_Sell() < sellPositions)
      {
         sellPositions = 20;
         buyPositions = 20;
         trade.Sell(0.1, NULL, Bid, 0, Bid - (500 * _Point), NULL);
         trade.Buy(0.1, NULL, Ask, 0, Ask + (200 * _Point), NULL);
      }
   }
   
   if(GetProfit_Sell() < -1500)
   {
      while(GetPositions_Buy() < buyPositions)
      {
         sellPositions = 20;
         buyPositions = 20;
         trade.Buy(0.1, NULL, Ask, 0, Ask + (500 * _Point), NULL);
         trade.Sell(0.1, NULL, Bid, 0, Bid - (200 * _Point), NULL);
      }
   }
   
   while(macdValue > 0 && macdValueLastButOneCheck > 0 && macdValueLastButOne < 0 && GetPositions_Sell() < sellPositions)
   {
      trade.Sell(0.1, NULL, Bid, 0, Bid - (300 * _Point), NULL);
   }
   
   while(macdValue < 0 && macdValueLastButOneCheck < 0 && macdValueLastButOne > 0 && GetPositions_Buy() < buyPositions)
   {
      trade.Buy(0.1, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   }
   
   Comment(
      "MacD Index [0] = ", DoubleToString(priceInfo[0], 2),
      "\nMacD Index [1] = ", DoubleToString(priceInfo[1], 2),
      "\nMacD Index [2] = ", DoubleToString(priceInfo[2], 2),
      "\nMacD Index [3] = ", DoubleToString(priceInfo[3], 2),
      "\nMacD Index [4] = ", DoubleToString(priceInfo[4], 2),
      "\nMacD Index [5] = ", DoubleToString(priceInfo[5], 2),
      "\nMacD Index [6] = ", DoubleToString(priceInfo[6], 2),
      "\nMacD Index [7] = ", DoubleToString(priceInfo[7], 2),
      "\nMacD Index [8] = ", DoubleToString(priceInfo[8], 2),
      "\nMacD Index [9] = ", DoubleToString(priceInfo[9], 2),
      "\nBalance = ", AccountInfoDouble(ACCOUNT_BALANCE),
      "\nEquity = ", AccountInfoDouble(ACCOUNT_EQUITY),
      "\nBuy Positions : ", GetPositions_Buy(),
      "\nSell Positions : ", GetPositions_Sell(),
      "\nTotal Positions : ", PositionsTotal(),
      "\nSell Profit : ", GetProfit_Sell(),
      "\nBuy Profit : ", GetProfit_Buy()          
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

double GetProfit_Sell()
{
   int sellProfit = 0;
   
   for(int i = PositionsTotal() -1; i >= 0; i--)
   {
      string CurrencyPair = PositionGetSymbol(i);
      
      int PositionDirection = PositionGetInteger(POSITION_TYPE);
      
      if(Symbol() == CurrencyPair)
      {
         if(PositionDirection == POSITION_TYPE_SELL)
         {
            sellProfit += PositionGetDouble(POSITION_PROFIT);
         }         
      }
   }
   
   return sellProfit;
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

double GetProfit_Buy()
{
   double buyProfit = 0;
   
   for(int i = PositionsTotal() -1; i >= 0; i--)
   {
      string CurrencyPair = PositionGetSymbol(i);
      
      int PositionDirection = PositionGetInteger(POSITION_TYPE);
      
      if(Symbol() == CurrencyPair)
      {
         if(PositionDirection == POSITION_TYPE_BUY)
         {
            buyProfit += PositionGetDouble(POSITION_PROFIT);
         }         
      }
   }
   
   return buyProfit;
}