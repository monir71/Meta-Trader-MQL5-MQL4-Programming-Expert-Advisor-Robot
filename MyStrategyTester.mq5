#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   string signal = T_AverageDirectionalMovementIndexWilder();
   
   if(signal == "Buy" && GetPositions_Buy() < 1)
      trade.Buy(1, NULL, Ask, 0, Ask + (300 * _Point), NULL);
   
   if(signal == "Sell" && GetPositions_Sell() < 1)
      trade.Sell(1, NULL, Bid, 0, Bid - (300 * _Point), NULL);
}

string T_AverageDirectionalMovementIndex()
{
   string signal = "";
   //Developed by J. Welles Wilder
   //This a momentum indicator used to determine the strength of a gold price trend; 
   //it is derived from the DMI – Directional Movement Index which has two lines.
   //+DI - Positive Directional Movement Index
   //-DI - Negative Directional Movement Index
   //ADX is calculated by subtracting these two values and applying a smoothing function.   
   //The ADX is not a directional indicator but a measure of the strength of the trend which has a scale of 0 to 100.
   //The higher the indicator value the stronger the trend.
   //A value of below 20 indicates that the gold market is not trending but moving in a range.
   //A value of above 20 confirms a buy or sell signal and indicates a new trend is emerging.
   //Values above 30 signifies a strong trending market.
   //When ADX turns down from above 30, it signifies that the current trend is losing momentum.   
   //Since the ADX alone is a directionless indicator it is combined with the DMI index -
   //to determine the direction of the gold trading instrument.
   //When the ADX is combined with DMI index a trader can determine the direction of -
   //the trend and then use the this indicator to determine the momentum of the prevailing trend direction.      
   //A buy signal is generated when the +DI is above –DI, and the ADX is above 20
   //The Exit signal is generated when the indicator turns down from above 30.
   //A short signal is generated when the –DI is above +DI, and the ADX is above 20
   //The Exit signal is generated when the indicator turns down from above 30.
   
   //Create a price array
   double myPriceArray[];
   double PositiveDirectionalIndicatorArray[];
   double NegativeDirectionalIndicatorArray[];
   
   //Set the price array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   ArraySetAsSeries(PositiveDirectionalIndicatorArray, true);
   ArraySetAsSeries(NegativeDirectionalIndicatorArray, true);
   
   //Dine Average Directional Moving Index (ADX)
   int AverageDirectionalMovingIndexDefinition = iADX(_Symbol, _Period, 14);
   int PositiveDirectionalIndicatorDefinition = iADX(_Symbol, _Period, 14);
   int NegativeDirectionalIndicatorDefinition = iADX(_Symbol, _Period, 14);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(AverageDirectionalMovingIndexDefinition, 0, 0, 3, myPriceArray);
   CopyBuffer(PositiveDirectionalIndicatorDefinition, 1, 0, 3, PositiveDirectionalIndicatorArray);
   CopyBuffer(NegativeDirectionalIndicatorDefinition, 2, 0, 3, NegativeDirectionalIndicatorArray);
   
   //Get the value
   double AverageDirectionalMovingIndexValue = NormalizeDouble(myPriceArray[0], 2);
   double PositiveDirectionalIndicatorValue = NormalizeDouble(PositiveDirectionalIndicatorArray[0], 2);
   double NegativeDirectionalIndicatorValue = NormalizeDouble(NegativeDirectionalIndicatorArray[0], 2);
   
   //Get Previous ADX
   double PreviousAverageDirectionalMovingIndexValue = NormalizeDouble(myPriceArray[1], 2);
   
   /*
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy (Strong Long Trend)";
   
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy (the market is not trending but moving in a range)";
   
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell (Strong Short Trend)"; 
      
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell (the market is not trending but moving in a range)";
      
   if(PreviousAverageDirectionalMovingIndexValue > AverageDirectionalMovingIndexValue)
      signal += ". The current trend is losing momentum"; 
   */
   
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";
   
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";
   
   /*
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell"; 
      
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell";
   */

   return signal;
}

string T_AverageDirectionalMovementIndexWilder()
{
   string signal = "";
   //Developed by J. Welles Wilder
   //This a momentum indicator used to determine the strength of a gold price trend; 
   //it is derived from the DMI – Directional Movement Index which has two lines.
   //+DI - Positive Directional Movement Index
   //-DI - Negative Directional Movement Index
   //ADX is calculated by subtracting these two values and applying a smoothing function.   
   //The ADX is not a directional indicator but a measure of the strength of the trend which has a scale of 0 to 100.
   //The higher the indicator value the stronger the trend.
   //A value of below 20 indicates that the gold market is not trending but moving in a range.
   //A value of above 20 confirms a buy or sell signal and indicates a new trend is emerging.
   //Values above 30 signifies a strong trending market.
   //When ADX turns down from above 30, it signifies that the current trend is losing momentum.   
   //Since the ADX alone is a directionless indicator it is combined with the DMI index -
   //to determine the direction of the gold trading instrument.
   //When the ADX is combined with DMI index a trader can determine the direction of -
   //the trend and then use the this indicator to determine the momentum of the prevailing trend direction.      
   //A buy signal is generated when the +DI is above –DI, and the ADX is above 20
   //The Exit signal is generated when the indicator turns down from above 30.
   //A short signal is generated when the –DI is above +DI, and the ADX is above 20
   //The Exit signal is generated when the indicator turns down from above 30.
   
   //Create a price array
   double myPriceArray[];
   double PositiveDirectionalIndicatorArray[];
   double NegativeDirectionalIndicatorArray[];
   
   //Set the price array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   ArraySetAsSeries(PositiveDirectionalIndicatorArray, true);
   ArraySetAsSeries(NegativeDirectionalIndicatorArray, true);
   
   //Dine Average Directional Moving Index (ADX)
   int AverageDirectionalMovingIndexDefinition = iADXWilder(_Symbol, _Period, 14);
   int PositiveDirectionalIndicatorDefinition = iADXWilder(_Symbol, _Period, 14);
   int NegativeDirectionalIndicatorDefinition = iADXWilder(_Symbol, _Period, 14);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(AverageDirectionalMovingIndexDefinition, 0, 0, 3, myPriceArray);
   CopyBuffer(PositiveDirectionalIndicatorDefinition, 1, 0, 3, PositiveDirectionalIndicatorArray);
   CopyBuffer(NegativeDirectionalIndicatorDefinition, 2, 0, 3, NegativeDirectionalIndicatorArray);
   
   //Get the value
   double AverageDirectionalMovingIndexValue = NormalizeDouble(myPriceArray[0], 2);
   double PositiveDirectionalIndicatorValue = NormalizeDouble(PositiveDirectionalIndicatorArray[0], 2);
   double NegativeDirectionalIndicatorValue = NormalizeDouble(NegativeDirectionalIndicatorArray[0], 2);
   
   //Get Previous ADX
   double PreviousAverageDirectionalMovingIndexValue = NormalizeDouble(myPriceArray[1], 2);
   
   /*
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy (Strong Long Trend)";
   
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy (the market is not trending but moving in a range)";
   
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell (Strong Short Trend)"; 
      
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell (the market is not trending but moving in a range)";
      
   if(PreviousAverageDirectionalMovingIndexValue > AverageDirectionalMovingIndexValue)
      signal += ". The current trend is losing momentum"; 
   */
   
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";
   
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell";
      
    /*
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";

   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell";

   */
   
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