#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(GetValue_AccceleratorOscillator() > 0.0001 && GetPositions_Sell() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - (300 * _Point), NULL);
   if(GetValue_AccceleratorOscillator() < -0.0001 && GetPositions_Buy() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   
   /*   
   if(CheckEntry_AccceleratorOscillator() == "Long" && GetPositions_Sell() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - (300 * _Point), NULL);
      
   if(CheckEntry_AccceleratorOscillator() == "Short" && GetPositions_Buy() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   */
      
   Comment("Buy Positions: ", GetPositions_Buy(), "\nSell Positions: ", GetPositions_Sell(), "\nValue: ", GetValue_AccceleratorOscillator());
            
}

double GetValue_AccceleratorOscillator()
{
   double Value = 0.00;
   
   double AcceleratorOscillatorArray[];
   ArraySetAsSeries(AcceleratorOscillatorArray, true);
   int AcceleratorOscillatorHandler = iAC(_Symbol, _Period);
   CopyBuffer(AcceleratorOscillatorHandler, 0, 0, 3, AcceleratorOscillatorArray);
   Value = AcceleratorOscillatorArray[0];
   return Value;
}

string CheckEntry_AccceleratorOscillator()
{
   string Signal = "";
   
   double AcceleratorOscillatorArray[];
   ArraySetAsSeries(AcceleratorOscillatorArray, true);
   int AcceleratorOscillatorHandler = iAC(_Symbol, _Period);
   CopyBuffer(AcceleratorOscillatorHandler, 0, 0, 3, AcceleratorOscillatorArray);
   double Current_AcceleratorOscillator_Value = AcceleratorOscillatorArray[0];
   double Previous_AcceleratorOscillator_Value = AcceleratorOscillatorArray[1];
   
   if(Current_AcceleratorOscillator_Value > 0 && Previous_AcceleratorOscillator_Value > Current_AcceleratorOscillator_Value)
      Signal = "Long";
   if(Current_AcceleratorOscillator_Value < 0 && Previous_AcceleratorOscillator_Value < Current_AcceleratorOscillator_Value)
      Signal = "Short";
      
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