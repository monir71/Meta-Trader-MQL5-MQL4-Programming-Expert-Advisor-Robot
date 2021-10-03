//+------------------------------------------------------------------+
//|                                Best use of Stochastic Oscillator |
//|                    Copyright 2021, Strength & Honour Corporation |
//|                                https://www.StrengthAndHonour.com |
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>
CTrade trade;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);

   if(CheckEntry_StochasticOscillator() == "Buy" && GetPositions_Buy() < 100 && Check_Momentum_Entry() == "Buy")
     {
      //For H1
      //trade.Buy(0.01, NULL, Ask, 0, Ask + 500 * _Point, NULL);
      //For M1
      trade.Buy(0.01, NULL, Ask, 0, Ask + 300 * _Point, NULL);
     }

   if(CheckEntry_StochasticOscillator() == "Sell" && GetPositions_Sell() < 100 && Check_Momentum_Entry() == "Sell")
     {
      //For H1
      //trade.Sell(0.01, NULL, Bid, 0, Bid - 500 * _Point, NULL);
      //For M1
      trade.Sell(0.01, NULL, Bid, 0, Bid - 300 * _Point, NULL);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CheckEntry_StochasticOscillator()
  {
   string Signal = "";

   double KArray[];
   double DArray[];

   int StochasticOscillatorHandler = iStochastic(_Symbol, _Period, 5, 3, 3, MODE_SMA, STO_LOWHIGH);

   ArraySetAsSeries(KArray, true);
   ArraySetAsSeries(DArray, true);

   CopyBuffer(StochasticOscillatorHandler, 0, 0, 3, KArray);
   CopyBuffer(StochasticOscillatorHandler, 1, 0, 3, DArray);

   double KValue0 = KArray[0];
   double DValue0 = DArray[0];

   double KValue1 = KArray[1];
   double DValue1 = DArray[1];

   if(KValue0 < 20 && DValue0 < 20)
      if(KValue0 > DValue0 && KValue1 < DValue1)
         Signal = "Buy";

   if(KValue0 > 80 && DValue0 > 80)
      if(KValue0 < DValue0 && KValue1 > DValue1)
         Signal = "Sell";

   return Signal;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseAllPositions()
  {
   for(int i = PositionsTotal() -1; i >= 0; i--)
     {
      int ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
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
//+------------------------------------------------------------------+

