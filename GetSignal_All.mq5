#include<Trade\Trade.mqh>
CTrade trade;
CPositionInfo  m_position;

void OnTick()
{   
   //Trend (13)
   string AdaptiveMovingAverage = T_AdaptiveMovingAverage();
   string AverageDirectionalMovementIndex = T_AverageDirectionalMovementIndex();
   string AverageDirectionalMovementIndexWilder = T_AverageDirectionalMovementIndexWilder();
   string BollingerBands = T_BollingerBands();
   string DoubleExponentialMovingAverage = T_DoubleExponentialMovingAverage();
   string Envelopes = T_Envelopes();
   string FractalAdaptiveMovingAverage = T_FractalAdaptiveMovingAverage();
   string IchimokuKinkoHyo = T_IchimokuKinkoHyo();
   string MovingAverage = T_MovingAverage();
   string ParabolicSar = T_ParabolicSar();
   string StandardDeviation = T_StandardDeviation();
   string TripleExponentialMovingAverage = T_TripleExponentialMovingAverage();
   string VariableIndexDynamicAverage = T_VariableIndexDynamicAverage();
   //Oscillator (15)
   string AverageTrueRange = O_AverageTrueRange();
   string BearsPower = O_BearsPower();
   string BullsPower = O_BullsPower();
   string ChaikinOscillator = O_ChaikinOscillator();
   string CommodityChannelInndex = O_CommodityChannelInndex();
   string DeMarker = O_DeMarker();
   string ForceIndex = O_ForceIndex();
   string Macd = O_Macd();
   string Momentum = O_Momentum();
   string MovingAverageOfOscillator = O_MovingAverageOfOscillator();
   string RelativeStrengthIndex = O_RelativeStrengthIndex();
   string RelativeVigorIndex = O_RelativeVigorIndex();
   string StochasticOscillator = O_StochasticOscillator();
   string TripleExponentialAverage = O_TripleExponentialAverage();
   string WilliamsPercentRange = O_WilliamsPercentRange();
   //Volumes (4)
   string AccumulationDistribution = V_AccumulationDistribution();
   string MoneyFlowIndex = V_MoneyFlowIndex();
   string OnBalanceVolume = V_OnBalanceVolume();
   string Volumes = V_Volumes();
   //Bill Williams (6)
   string AcceleratorOscillator = BW_AcceleratorOscillator();
   string Alligator = BW_Alligator();
   string AwesomeOscillator = BW_AwesomeOscillator();
   string Fractals = BW_Fractals();
   string GatorOscillator = BW_GatorOscillator();
   string MarketFacilitationIndex = BW_MarketFacilitationIndex();
   //Custom(8)
   string Custom_TripleMovingAverage = Custom_TripleMovingAverage();
   string PositionsProfit = PositionsProfit();
   string SellPositions = SellPositions();
   string BuyPositions = BuyPositions();
   //string ClosePositions = ClosePositions();
   string TotalPositions = TotalPositions();
   string EMACrossOver = EMACrossOver();
   string ShiftedMovingAverage = ShiftedMovingAverage();
   string EA_MA_Cross_Over = EA_MA_Cross_Over(20, 50);
   string AdvancedMomentumEA = TradeNowOnMomentum();
   
   
   string commentString =
      "Adaptive Moving Average : " + AdaptiveMovingAverage + "\n" + 
      "Average Directional Movement Index : " + AverageDirectionalMovementIndex + "\n" +
      "Average Directional Movement Index Wilder : " + AverageDirectionalMovementIndexWilder + "\n" +
      "Bollinger Bands : " + BollingerBands + "\n" +
      "Double Exponential Moving Average : " + DoubleExponentialMovingAverage + "\n" +
      "Envelopes : " + Envelopes + "\n" +
      "Fractal Adaptive Moving Average : " + FractalAdaptiveMovingAverage + "\n" +
      "Ichimoku Kinko Hyo : " + IchimokuKinkoHyo + "\n" +
      "Moving Average : " + MovingAverage + "\n" +
      "Parabolic SAR : " + ParabolicSar + "\n" +
      "Standard Deviation : " + StandardDeviation + "\n" +
      "Triple Exponential Moving Average : " + TripleExponentialMovingAverage + "\n" +
      "Variable Index Dynamic Average : " + VariableIndexDynamicAverage + "\n" +
      "Average True Range : " + AverageTrueRange + "\n" +
      "Bears Power : " + BearsPower + "\n" +
      "Bulls Power : " + BullsPower + "\n" +
      "Chaikin Oscillator : " + ChaikinOscillator + "\n" +
      "Commodity Channel Inndex : " + CommodityChannelInndex + "\n" +
      "DeMarker : " + DeMarker + "\n" +
      "Force Index : " + ForceIndex + "\n" +
      "Macd : " + Macd + "\n" +
      "Momentum : " + Momentum + "\n" +
      "Moving Average Of Oscillator : " + MovingAverageOfOscillator + "\n" +
      "Relative Strength Index : " + RelativeStrengthIndex + "\n" +
      "Relative Vigor Index : " + RelativeVigorIndex + "\n" +
      "Stochastic Oscillator : " + StochasticOscillator + "\n" +
      "Triple Exponential Average : " + TripleExponentialAverage + "\n" +
      "Williams PercentRange : " + WilliamsPercentRange + "\n" +
      "Accumulation Distribution : " + AccumulationDistribution + "\n" +
      "Money Flow Index : " + MoneyFlowIndex + "\n" +
      "On Balance Volume : " + OnBalanceVolume + "\n" +
      "Volumes : " + Volumes + "\n" +
      "Accelerator Oscillator : " + AcceleratorOscillator + "\n" +
      "Alligator : " + Alligator + "\n" +
      "Awesome Oscillator : " + AwesomeOscillator + "\n" +
      "Fractals : " + Fractals + "\n" +
      "Gator Oscillator : " + GatorOscillator + "\n" +
      "Market Facilitation Index : " + MarketFacilitationIndex + "\n" +
      "Custom Triple Moving Average : " + Custom_TripleMovingAverage + "\n" +
      "EMA Cross Over : " + EMACrossOver + "\n" +
      "Shifted Moving Average : " + ShiftedMovingAverage + "\n" +
      "Sell Positions : " + SellPositions + "\n" +
      "Buy Positions : " + BuyPositions + "\n" +
      "Positions Profit : " + PositionsProfit + "\n" +
      "Total Positions : " + TotalPositions + "\n" +
      "EA MA Crossover (imp!) : " + EA_MA_Cross_Over + "\n" +
      "Advanced Momentum EA : " + AdvancedMomentumEA;
   
   //Comment(commentString);
}

void OnChartEvent(const int id, const long& lParam, const double& dParam, const string& sParam)
{
   //Trend (13)
   string AdaptiveMovingAverage = T_AdaptiveMovingAverage();
   string AverageDirectionalMovementIndex = T_AverageDirectionalMovementIndex();
   string AverageDirectionalMovementIndexWilder = T_AverageDirectionalMovementIndexWilder();
   string BollingerBands = T_BollingerBands();
   string DoubleExponentialMovingAverage = T_DoubleExponentialMovingAverage();
   string Envelopes = T_Envelopes();
   string FractalAdaptiveMovingAverage = T_FractalAdaptiveMovingAverage();
   string IchimokuKinkoHyo = T_IchimokuKinkoHyo();
   string MovingAverage = T_MovingAverage();
   string ParabolicSar = T_ParabolicSar();
   string StandardDeviation = T_StandardDeviation();
   string TripleExponentialMovingAverage = T_TripleExponentialMovingAverage();
   string VariableIndexDynamicAverage = T_VariableIndexDynamicAverage();
   //Oscillator (15)
   string AverageTrueRange = O_AverageTrueRange();
   string BearsPower = O_BearsPower();
   string BullsPower = O_BullsPower();
   string ChaikinOscillator = O_ChaikinOscillator();
   string CommodityChannelInndex = O_CommodityChannelInndex();
   string DeMarker = O_DeMarker();
   string ForceIndex = O_ForceIndex();
   string Macd = O_Macd();
   string Momentum = O_Momentum();
   string MovingAverageOfOscillator = O_MovingAverageOfOscillator();
   string RelativeStrengthIndex = O_RelativeStrengthIndex();
   string RelativeVigorIndex = O_RelativeVigorIndex();
   string StochasticOscillator = O_StochasticOscillator();
   string TripleExponentialAverage = O_TripleExponentialAverage();
   string WilliamsPercentRange = O_WilliamsPercentRange();
   //Volumes (4)
   string AccumulationDistribution = V_AccumulationDistribution();
   string MoneyFlowIndex = V_MoneyFlowIndex();
   string OnBalanceVolume = V_OnBalanceVolume();
   string Volumes = V_Volumes();
   //Bill Williams (6)
   string AcceleratorOscillator = BW_AcceleratorOscillator();
   string Alligator = BW_Alligator();
   string AwesomeOscillator = BW_AwesomeOscillator();
   string Fractals = BW_Fractals();
   string GatorOscillator = BW_GatorOscillator();
   string MarketFacilitationIndex = BW_MarketFacilitationIndex();
   //Custom(8)
   string Custom_TripleMovingAverage = Custom_TripleMovingAverage();
   string PositionsProfit = PositionsProfit();
   string SellPositions = SellPositions();
   string BuyPositions = BuyPositions();
   //string ClosePositions = ClosePositions();
   string TotalPositions = TotalPositions();
   string EMACrossOver = EMACrossOver();
   string ShiftedMovingAverage = ShiftedMovingAverage();
   string EA_MA_Cross_Over = EA_MA_Cross_Over(20, 50);
   string AdvancedMomentumEA = TradeNowOnMomentum();
   
   
   string commentString =
      "Adaptive Moving Average : " + AdaptiveMovingAverage + "\n" + 
      "Average Directional Movement Index : " + AverageDirectionalMovementIndex + "\n" +
      "Average Directional Movement Index Wilder : " + AverageDirectionalMovementIndexWilder + "\n" +
      "Bollinger Bands : " + BollingerBands + "\n" +
      "Double Exponential Moving Average : " + DoubleExponentialMovingAverage + "\n" +
      "Envelopes : " + Envelopes + "\n" +
      "Fractal Adaptive Moving Average : " + FractalAdaptiveMovingAverage + "\n" +
      "Ichimoku Kinko Hyo : " + IchimokuKinkoHyo + "\n" +
      "Moving Average : " + MovingAverage + "\n" +
      "Parabolic SAR : " + ParabolicSar + "\n" +
      "Standard Deviation : " + StandardDeviation + "\n" +
      "Triple Exponential Moving Average : " + TripleExponentialMovingAverage + "\n" +
      "Variable Index Dynamic Average : " + VariableIndexDynamicAverage + "\n" +
      "Average True Range : " + AverageTrueRange + "\n" +
      "Bears Power : " + BearsPower + "\n" +
      "Bulls Power : " + BullsPower + "\n" +
      "Chaikin Oscillator : " + ChaikinOscillator + "\n" +
      "Commodity Channel Inndex : " + CommodityChannelInndex + "\n" +
      "DeMarker : " + DeMarker + "\n" +
      "Force Index : " + ForceIndex + "\n" +
      "Macd : " + Macd + "\n" +
      "Momentum : " + Momentum + "\n" +
      "Moving Average Of Oscillator : " + MovingAverageOfOscillator + "\n" +
      "Relative Strength Index : " + RelativeStrengthIndex + "\n" +
      "Relative Vigor Index : " + RelativeVigorIndex + "\n" +
      "Stochastic Oscillator : " + StochasticOscillator + "\n" +
      "Triple Exponential Average : " + TripleExponentialAverage + "\n" +
      "Williams PercentRange : " + WilliamsPercentRange + "\n" +
      "Accumulation Distribution : " + AccumulationDistribution + "\n" +
      "Money Flow Index : " + MoneyFlowIndex + "\n" +
      "On Balance Volume : " + OnBalanceVolume + "\n" +
      "Volumes : " + Volumes + "\n" +
      "Accelerator Oscillator : " + AcceleratorOscillator + "\n" +
      "Alligator : " + Alligator + "\n" +
      "Awesome Oscillator : " + AwesomeOscillator + "\n" +
      "Fractals : " + Fractals + "\n" +
      "Gator Oscillator : " + GatorOscillator + "\n" +
      "Market Facilitation Index : " + MarketFacilitationIndex + "\n" +
      "Custom Triple Moving Average : " + Custom_TripleMovingAverage + "\n" +
      "EMA Cross Over : " + EMACrossOver + "\n" +
      "Shifted Moving Average : " + ShiftedMovingAverage + "\n" +
      "Sell Positions : " + SellPositions + "\n" +
      "Buy Positions : " + BuyPositions + "\n" +
      "Positions Profit : " + PositionsProfit + "\n" +
      "Total Positions : " + TotalPositions + "\n" +
      "EA MA Crossover (imp!) : " + EA_MA_Cross_Over + "\n" +
      "Advanced Momentum EA : " + AdvancedMomentumEA;

   if(id==CHARTEVENT_CLICK)
   {
      MessageBox(commentString, "Monitor All Signals", MB_OKCANCEL);
   }
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                  |||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||     Adaptive Moving Average      |||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                  |||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_AdaptiveMovingAverage()
{
   string signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   double T_AdaptiveMovingAverage_Array[];
   ArraySetAsSeries(T_AdaptiveMovingAverage_Array, true);
   
   int T_AdaptiveMovingAverage_Handler = iAMA(_Symbol, _Period, 9, 2, 30, 0, PRICE_CLOSE);
   CopyBuffer(T_AdaptiveMovingAverage_Handler, 0, 0, 3, T_AdaptiveMovingAverage_Array);
   
   double T_AdaptiveMovingAverage_Value = NormalizeDouble(T_AdaptiveMovingAverage_Array[0], 6);
   
   if(T_AdaptiveMovingAverage_Value > priceInformation[0].close)
      signal = "Sell";
   if(T_AdaptiveMovingAverage_Value < priceInformation[0].close)
      signal = "Buy";
      
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||| Average Directional Movement Index  ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

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
   
   /*
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";
   
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";
   
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell"; 
      
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell";
   */
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||                                           ||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||| Average Directional Movement Index Wilder ||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||                                           ||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

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

   /*
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";
   
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue > NegativeDirectionalIndicatorValue)
      signal = "Buy";
   
   if(AverageDirectionalMovingIndexValue > 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell"; 
      
   if(AverageDirectionalMovingIndexValue < 20 && 
   PositiveDirectionalIndicatorValue < NegativeDirectionalIndicatorValue)
      signal = "Sell";
   */
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||         Bollinger Bands             ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_BollingerBands()
{
   string signal = "";
   
   //Create an array for several prices
   double UpperBandArray[];
   double MiddleBandArray[];
   double LowerBandArray[];
   
   //Sort the price array from the current candle downwards
   ArraySetAsSeries(UpperBandArray, true);
   ArraySetAsSeries(MiddleBandArray, true);
   ArraySetAsSeries(LowerBandArray, true);
   
   //Define Bollinger Bands
   int BollingerBandsDefiniition = iBands(_Symbol, _Period, 20, 0, 2, PRICE_CLOSE);
   
   //Copy price info into the array
   CopyBuffer(BollingerBandsDefiniition, 1, 0, 3, UpperBandArray);
   CopyBuffer(BollingerBandsDefiniition, 0, 0, 3, MiddleBandArray);
   CopyBuffer(BollingerBandsDefiniition, 2, 0, 3, LowerBandArray);
   
   //Calculate EA for the current candle
   double UpperBandValue = UpperBandArray[0];
   double MiddleBandValue = MiddleBandArray[0];
   double LowerBandValue = LowerBandArray[0];
   
   double lowerBandValueLastButOne = LowerBandArray[1];
   double upperBandValueLastButOne = UpperBandArray[1];
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int priceData = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   if(priceInformation[0].close > LowerBandValue && priceInformation[1].close < lowerBandValueLastButOne)
      signal = "Buy";
   if(priceInformation[0].close < UpperBandValue && priceInformation[1].close > upperBandValueLastButOne)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||  Double Exponential Moving Average  ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_DoubleExponentialMovingAverage()
{
   string signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double DoubleExponentialMovingAverageArray[];
   int DoubleExponentialMovingAverageHandler = iDEMA(_Symbol, _Period, 14, 0, PRICE_CLOSE);
   ArraySetAsSeries(DoubleExponentialMovingAverageArray, true);
   CopyBuffer(DoubleExponentialMovingAverageHandler, 0, 0, 3, DoubleExponentialMovingAverageArray);
      
   double DoubleExponentialMovingAverageValue = DoubleExponentialMovingAverageArray[1];
   
   if(DoubleExponentialMovingAverageValue < priceInformation[1].close)
      signal = "Buy";
   
   if(DoubleExponentialMovingAverageValue > priceInformation[1].close)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||             Envelopes               ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_Envelopes()
{
   string signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double upperBandArray[];
   double lowerBandArray[];
   
   int EnvelopesHandler = iEnvelopes(_Symbol, _Period, 14, 0, MODE_SMA, PRICE_CLOSE, 0.100);
   
   ArraySetAsSeries(upperBandArray, true);
   ArraySetAsSeries(lowerBandArray, true);
   
   CopyBuffer(EnvelopesHandler, 0, 0, 3, upperBandArray);
   CopyBuffer(EnvelopesHandler, 1, 0, 3, lowerBandArray);
   
   double upperBandValue = NormalizeDouble(upperBandArray[0], 6);
   double lowerBandValue = NormalizeDouble(lowerBandArray[0], 6);
   
   if(priceInformation[1].close > upperBandValue)
      signal = "Sell";
   if(priceInformation[1].close < lowerBandValue)
      signal = "Buy";
      
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||  Fractal Adaptive Moving Average    ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_FractalAdaptiveMovingAverage()
{
   string signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double FractalAdaptiveMovingAverageArray[];
   int FractalAdaptiveMovingAverageHandler = iFrAMA(_Symbol, _Period, 14, 0, PRICE_CLOSE);
   ArraySetAsSeries(FractalAdaptiveMovingAverageArray, true);
   CopyBuffer(FractalAdaptiveMovingAverageHandler, 0, 0, 3, FractalAdaptiveMovingAverageArray);
   double FractalAdaptiveMovingAverageValue = FractalAdaptiveMovingAverageArray[0];
   
   if(FractalAdaptiveMovingAverageValue > priceInformation[1].high)
      signal = "Buy";
   if(FractalAdaptiveMovingAverageValue < priceInformation[1].low)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||       Ichimoku Kinko Hyo            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_IchimokuKinkoHyo()
{
   string signal = ""; //May not be necessary
   
   /*
   Ichimoku Kinko Hyo (IKH) is an indicator that gauges future price momentum and 
   determines future areas of support and resistance.
   Now that’s 3-in-1 for y’all! Also, know that this indicator is mainly used on JPY pairs.
   To add to your Japanese vocab, the word ichimoku translates to “a glance”, 
   kinko means “equilibrium”, while hyo is Japanese for “chart.”
   Putting that all together, the phrase ichimoku kinko hyo stands for 
   “a glance at a chart in equilibrium.”
   But before we do that, there are a couple of things about this indicator 
   that you should know about first:
      Ichimoku can be used in all time frames for any tradeable asset.
      (It was originally used to trade rice!)
      Ichimoku can be used in both rising and falling markets.
   So when CAN’T you use Ichimoku?
   When no clear trend exists.
   Basically, when the market is trading sideways, choppy, aka trendless.
   You’ll know it’s trendless when the price is oscillating on either side of the cloud.
   Got it! Excellent.
   Now let’s try to find out what each of the lines is for.
   
   Kijun Sen (blue line): Also called the standard line or base line, 
   this is calculated by averaging the highest high and the lowest low for the past 26 periods.
   
   Tenkan Sen (red line): This is also known as the turning line and is derived by 
   averaging the highest high and the lowest low for the past nine periods.
   
   Chikou Span (green line): This is called the lagging line. 
   It is today’s closing price plotted 26 periods behind.
   
   Senkou Span (orange lines): The first Senkou line is calculated by averaging the 
   Tenkan Sen and the Kijun Sen and plotted 26 periods ahead.
   
   The second Senkou line is determined by averaging the highest high and 
   the lowest low for the past 52 periods and plotted 26 periods ahead.
   
   How to Trade Using Ichimoku Kinko Hyo?
   
   Senkou
   Let’s take a look at the Senkou span first.

   If the price is above the Senkou span, the top line serves as the first support level while 
   the bottom line serves as the second support level.

   If the price is below the Senkou span, the bottom line forms the first resistance level 
   while the top line is the second resistance level. Got it?
   
   Kijun Sen
   Meanwhile, the Kijun Sen acts as an indicator of future price movement.

   If the price is higher than the blue line, it could continue to climb higher.

   If the price is below the blue line, it could keep dropping.
   
   Tenkan Sen
   The Tenkan Sen is an indicator of the market trend.

   If the red line is moving up or down, it indicates that the market is trending.

   If it moves horizontally, it signals that the market is ranging.
   
   Chikou Span
   Lastly, if the Chikou Span or the green line crosses the price in the bottom-up direction,
   that’s a buy signal.

   If the green line crosses the price from the top-down, that’s a sell signal.
   */
   
   double Tenkansen_Array[];
   double Kijunsen_Array[];
   double SenkouSpan_A_Array[];
   double SenkouSpan_B_Array[];
   double Chikouspan_Array[];
   
   ArraySetAsSeries(Tenkansen_Array, true);
   ArraySetAsSeries(Kijunsen_Array, true);
   ArraySetAsSeries(SenkouSpan_A_Array, true);
   ArraySetAsSeries(SenkouSpan_B_Array, true);
   ArraySetAsSeries(Chikouspan_Array, true);
      
   int IchimokuHandler = iIchimoku(_Symbol, _Period, 9, 26, 52);
   
   CopyBuffer(IchimokuHandler, 0, 0, 7, Tenkansen_Array);
   CopyBuffer(IchimokuHandler, 1, 0, 3, Kijunsen_Array);
   CopyBuffer(IchimokuHandler, 2, 0, 3, SenkouSpan_A_Array);
   CopyBuffer(IchimokuHandler, 3, 0, 3, SenkouSpan_B_Array);
   CopyBuffer(IchimokuHandler, 4, 0, 3, Chikouspan_Array);
   
   //The Tenkan Sen is an indicator of the market trend.
   double Tenkansen_TurningLine_RedLine_Value_0 = Tenkansen_Array[0];
   double Tenkansen_TurningLine_RedLine_Value_2 = Tenkansen_Array[2];
   double Tenkansen_TurningLine_RedLine_Value_4 = Tenkansen_Array[4];
   double Tenkansen_TurningLine_RedLine_Value_6 = Tenkansen_Array[6];
   
   //Kijun Sen acts as an indicator of future price movement.   
   double Kijunsen_BaseLinne_BlueLine_Value = Kijunsen_Array[0];
   
   //To determine first support/resistannce level and second support/resistance level
   double SenkouSpan_A_SandyBrownLine_UpKumo_Value = SenkouSpan_A_Array[0]; 
   double SenkouSpan_B_ThistleLine_DownKumo_Value = SenkouSpan_B_Array[0]; 
   
   //This is called the lagging line.
   double Chikouspan_LaggingLine_LimeLine_Value = Chikouspan_Array[0];
   
   MqlRates priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInfo);
   
   string Tenkansen_trend = "";
   
   //Checking uptrend and price close above Red Line
   if(Tenkansen_TurningLine_RedLine_Value_0 > Tenkansen_TurningLine_RedLine_Value_2 &&
      Tenkansen_TurningLine_RedLine_Value_2 > Tenkansen_TurningLine_RedLine_Value_4 &&
      Tenkansen_TurningLine_RedLine_Value_4 > Tenkansen_TurningLine_RedLine_Value_6)
   {
      Tenkansen_trend = "Up";
   }
   
   //Checking downtrend and price close below Red Line
   if(Tenkansen_TurningLine_RedLine_Value_0 < Tenkansen_TurningLine_RedLine_Value_2 &&
      Tenkansen_TurningLine_RedLine_Value_2 < Tenkansen_TurningLine_RedLine_Value_4 &&
      Tenkansen_TurningLine_RedLine_Value_4 < Tenkansen_TurningLine_RedLine_Value_6)
   {
      Tenkansen_trend = "Down";
   }
   
   string Kijunsen_trend = "";
   
   //If the price is higher than the blue line, it could continue to climb higher.
   if(priceInfo[1].close > Kijunsen_BaseLinne_BlueLine_Value)
   {
      Kijunsen_trend = "Climbing";
   }
   //If the price is below the blue line, it could keep dropping.
   if(priceInfo[1].close < Kijunsen_BaseLinne_BlueLine_Value)
   {
      Kijunsen_trend = "Dropping";
   }
   
   string SenkouSpan_trend = "";
   //GBPUSD works fine
   
   //If the price is above the Senkou span, the top line serves as the first support level while 
   //the bottom line serves as the second support level.
   if(priceInfo[1].close > SenkouSpan_B_ThistleLine_DownKumo_Value &&
      priceInfo[2].close < SenkouSpan_B_ThistleLine_DownKumo_Value)
   {
      SenkouSpan_trend = "Buy";
   }

   //If the price is below the Senkou span, the bottom line forms the first resistance level 
   //while the top line is the second resistance level. Got it?
   
   if(priceInfo[1].close < SenkouSpan_B_ThistleLine_DownKumo_Value &&
      priceInfo[2].close > SenkouSpan_B_ThistleLine_DownKumo_Value)
   {
      SenkouSpan_trend = "Sell";

   }
   
   string Chikouspan_trend = "";
   //Does nothing
   
   //Lastly, if the Chikou Span or the green line crosses the price in the bottom-up direction,
   //that’s a buy signal.
   if(priceInfo[1].close > Chikouspan_LaggingLine_LimeLine_Value &&
      priceInfo[2].close < Chikouspan_LaggingLine_LimeLine_Value)
   {
      Chikouspan_trend = "Buy";
   }
   
   //If the green line crosses the price from the top-down, that’s a sell signal.
   if(priceInfo[1].close < Chikouspan_LaggingLine_LimeLine_Value &&
      priceInfo[2].close > Chikouspan_LaggingLine_LimeLine_Value)
   {
      Chikouspan_trend = "Sell";
   }

   if(Kijunsen_trend == "Climbing" && SenkouSpan_trend == "Buy" && Tenkansen_trend == "Up")
      signal = "Buy";
   
   if(Kijunsen_trend == "Dropping" && SenkouSpan_trend == "Sell" && Tenkansen_trend == "Down")
      signal = "Sell";
   
   return SenkouSpan_trend;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||           Moving Average            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_MovingAverage()
{
   string signal = "";
   
   MqlRates priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInfo);
   
   double movingAverageArray[];
   ArraySetAsSeries(movingAverageArray, true);
   int movingAverageHandler = iMA(_Symbol, _Period, 10, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(movingAverageHandler, 0, 0, 3, movingAverageArray);
   
   double movingAverageValue = movingAverageArray[0];
   
   if(priceInfo[1].close > movingAverageValue && priceInfo[2].close < movingAverageValue)
      signal = "Buy";
   if(priceInfo[1].close < movingAverageValue && priceInfo[2].close > movingAverageValue)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          Parabolic SAR              ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_ParabolicSar()
{
   string signal = "";
   
   MqlRates priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInfo);
   
   double ParabolicSARarray[];
   int ParabolicSARdefinition = iSAR(_Symbol, _Period, 0.02, 0.20);
   ArraySetAsSeries(ParabolicSARarray, true);
   CopyBuffer(ParabolicSARdefinition, 0, 0, 3, ParabolicSARarray);
   
   double ParabolicSARvalueCurrent = ParabolicSARarray[0];
   double ParabolicSARvaluePrevious = ParabolicSARarray[1];
   
   if(priceInfo[1].close > ParabolicSARvalueCurrent && priceInfo[2].close < ParabolicSARvaluePrevious)
      signal = "Buy";
   
   if(priceInfo[1].close < ParabolicSARvalueCurrent && priceInfo[2].close > ParabolicSARvaluePrevious)
      signal = "Sell";
      
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          Standard Deviation         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_StandardDeviation()
{
   string signal = "";
   
   //Standard Deviation – value of the market volatility measurement. 
   //This indicator describes the range of price fluctuations relative to simple moving average. 
   //So, if the value of this indicator is high, the market is volatile, 
   //and prices of bars are rather spread relative to the moving average.
   
   //An extremely high indicator is a sign that the market activity will soon slow down.
   // If the indicator shows a too low value, that is a sign of a calm market and 
   //an indication that market activity may soon spike.
   double StadardDeviationArray[];
   int StandardDeviationDefinition = iStdDev(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE);
   ArraySetAsSeries(StadardDeviationArray, true);
   CopyBuffer(StandardDeviationDefinition, 0, 0, 3, StadardDeviationArray);
   double StandardDeviationValue = NormalizeDouble(StadardDeviationArray[0], 6);
   
   signal = StandardDeviationValue;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||  Triple Exponential Moving Average  ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_TripleExponentialMovingAverage()
{
   string signal = "";
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   double TripleExponentialMovingAverageArray[];
   int TripleExponentialMovingAverageHandler = iTEMA(_Symbol, _Period, 14, 0, PRICE_CLOSE);
   ArraySetAsSeries(TripleExponentialMovingAverageArray, true);
   CopyBuffer(TripleExponentialMovingAverageHandler, 0, 0, 3, TripleExponentialMovingAverageArray);
   double TripleExponentialMovingAverageValue = NormalizeDouble(TripleExponentialMovingAverageArray[0], 2);
   
   if(TripleExponentialMovingAverageValue > priceInformation[1].close)
      signal = "Sell";
   if(TripleExponentialMovingAverageValue < priceInformation[1].close)
      signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||   Variable Index Dynamic Average    ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string T_VariableIndexDynamicAverage()
{
   string signal = "";
   
   MqlRates priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInfo);
   
   double VariableIndexDynamicAverageArray[];
   int VariableIndexDynamicAverageHandler = iVIDyA(_Symbol, _Period, 9, 12, 0, PRICE_CLOSE);
   ArraySetAsSeries(VariableIndexDynamicAverageArray, true);
   CopyBuffer(VariableIndexDynamicAverageHandler, 0, 0, 3, VariableIndexDynamicAverageArray);
   float VariableIndexDynamicAverageValue = VariableIndexDynamicAverageArray[0];
   
   if(VariableIndexDynamicAverageValue > priceInfo[1].close && VariableIndexDynamicAverageValue < priceInfo[2].close)
      signal = "Sell";
   if(VariableIndexDynamicAverageValue < priceInfo[1].close && VariableIndexDynamicAverageValue > priceInfo[2].close)
      signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||       Average True Range            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_AverageTrueRange()
{
   string signal = "";
   
   double AverageTrueRangeArray[];
   int AverageTrueRangeDefinition = iATR(_Symbol, _Period, 14);
   ArraySetAsSeries(AverageTrueRangeArray, true);
   CopyBuffer(AverageTrueRangeDefinition, 0, 0, 3, AverageTrueRangeArray);
   double AverageTrueRangeValue = NormalizeDouble(AverageTrueRangeArray[0], 5); 
   
   static double oldValue = 0;
   
   if(oldValue == 0)
      oldValue = AverageTrueRangeValue;
   if(AverageTrueRangeValue > oldValue)
      signal = "Buy";
   if(AverageTrueRangeValue < oldValue)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||             Bears Power             ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_BearsPower()
{
   string signal = "";
   
   double priceArray[];
   int BearsPowerDefinition = iBearsPower(_Symbol, _Period, 13);
   ArraySetAsSeries(priceArray, true);
   CopyBuffer(BearsPowerDefinition, 0, 0, 3, priceArray);
   float BearsPowerValue = priceArray[0];
   
   signal = BearsPowerValue;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||             Bulls Power             ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_BullsPower()
{
   string signal = "";
   
   double myPriceArray[];
   int BullsPowerDefinition = iBullsPower(_Symbol, _Period, 13);
   ArraySetAsSeries(myPriceArray, true);
   CopyBuffer(BullsPowerDefinition, 0, 0, 3, myPriceArray);

   float BullsPowerValue = myPriceArray[0];
   
   signal = BullsPowerValue;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||         Chaikin Oscillator          ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_ChaikinOscillator()
{
   string signal = "";
   
   double ChaikinArray[];
   int ChaikinDefinition = iChaikin(_Symbol, _Period, 3, 10, MODE_EMA, VOLUME_TICK);
   ArraySetAsSeries(ChaikinArray, true);
   CopyBuffer(ChaikinDefinition, 0, 0, 3, ChaikinArray);
   
   double chaikinValue = ChaikinArray[0];
   double previousChaikinValue = ChaikinArray[1];
   
   if(chaikinValue > 10 && previousChaikinValue < 10)
      signal = "Sell";
   if(chaikinValue < -10 && previousChaikinValue > -10)
      signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||    Commodity Channel Inndex         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_CommodityChannelInndex()
{
   string signal = "";
   
   double CommodityChannelIndexArray[];
   int CommodityChannelIndexHandler = iCCI(_Symbol, _Period, 32, PRICE_TYPICAL);
   ArraySetAsSeries(CommodityChannelIndexArray, true);
   CopyBuffer(CommodityChannelIndexHandler, 0, 0, 3, CommodityChannelIndexArray);
   float CommodityChannelIndexValue = CommodityChannelIndexArray[0];
   
   if(CommodityChannelIndexValue > 100)
      signal = "Sell";
   if(CommodityChannelIndexValue < -100)
      signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                De Marker            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_DeMarker()
{
   string signal = "";
   
   double myPriceArray[];
   int DemarkerDefinition = iDeMarker(_Symbol, _Period, 14);
   ArraySetAsSeries(myPriceArray, true);
   CopyBuffer(DemarkerDefinition, 0, 0, 3, myPriceArray);

   double DeMarkerValue = myPriceArray[0];
   
   if(DeMarkerValue > 0.7) signal = "Strong Trend";
   if(DeMarkerValue < 0.3) signal = "Weak Trend";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||              Force Index            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_ForceIndex()
{
   string signal = "";
   
   double myPriceArray[];
   ArraySetAsSeries(myPriceArray, true);
   int ForceIndexDefinition = iForce(_Symbol, _Period, 13, MODE_SMA, VOLUME_TICK);
   CopyBuffer(ForceIndexDefinition, 0, 0, 3, myPriceArray);
   double ForceIndexValue = NormalizeDouble(myPriceArray[0], 6);
   
   if(ForceIndexValue > 0) signal = "Trending Upwards";
   if(ForceIndexValue < 0) signal = "Trending downwards";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                  MACD               ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_Macd()
{
   string signal = "";
   
   double priceInformation[];   
   ArraySetAsSeries(priceInformation, true);   
   int MacDdefinition = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE);   
   CopyBuffer(MacDdefinition, 0, 0, 3, priceInformation);   
   float MacDValue = priceInformation[0];
   
   if(MacDValue < 0)
      signal = "Buy";
   
   if(MacDValue > 0)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                Momentum             ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_Momentum()
{
   string signal = "";
   
   double priceInformation[];   
   int MomentumDefinition = iMomentum(_Symbol, _Period, 14, PRICE_CLOSE);   
   ArraySetAsSeries(priceInformation, true);   
   CopyBuffer(MomentumDefinition, 0, 0, 3, priceInformation);   
   double MomentumValue = NormalizeDouble(priceInformation[0], 2);  
    
   if(MomentumValue > 100.00) signal = "Sell";   
   if(MomentumValue < 100.00) signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||    Moving Average Of Oscillator     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_MovingAverageOfOscillator()
{
   string signal = "";
   
   double priceInformation[];   
   int MovingAverageOfOscillatorHandler = iOsMA(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE);   
   ArraySetAsSeries(priceInformation, true);   
   CopyBuffer(MovingAverageOfOscillatorHandler, 0, 0, 3, priceInformation);   
   double MovingAverageOfOscillatorValue = priceInformation[0];  
    
   if(MovingAverageOfOscillatorValue > 0) signal = "Sell";   
   if(MovingAverageOfOscillatorValue < 0) signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||       Relative Strength Index       ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_RelativeStrengthIndex()
{
   string signal = "";
   
   double RSIArray[];   
   int RSIDefinition = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);   
   ArraySetAsSeries(RSIArray, true);   
   CopyBuffer(RSIDefinition, 0, 0, 3, RSIArray);   
   double RSIValue = NormalizeDouble(RSIArray[0], 2);
   
   if(RSIValue > 70.00)
      signal = "Sell";
   if(RSIValue < 30.00)
      signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||        Relative Vigor Index         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_RelativeVigorIndex()
{
   string signal = "";
   
   double RelativeVigorIndexArray1[];
   double RelativeVigorIndexArray2[];
   
   int RelativeVigorIndexHandler = iRVI(_Symbol, _Period, 10);
   
   ArraySetAsSeries(RelativeVigorIndexArray1, true);
   ArraySetAsSeries(RelativeVigorIndexArray2, true);
   
   CopyBuffer(RelativeVigorIndexHandler, 0, 0, 3, RelativeVigorIndexArray1);
   CopyBuffer(RelativeVigorIndexHandler, 1, 0, 3, RelativeVigorIndexArray2);
   
   double RelativeVigorIndexValue1 = NormalizeDouble(RelativeVigorIndexArray1[0], 3);
   double RelativeVigorIndexValue2 = NormalizeDouble(RelativeVigorIndexArray2[0], 3);
   
   if(RelativeVigorIndexValue1 < RelativeVigorIndexValue2 && RelativeVigorIndexValue1 < 0 && RelativeVigorIndexValue2 < 0)
      signal = "Buy";
   if(RelativeVigorIndexValue1 > RelativeVigorIndexValue2 && RelativeVigorIndexValue1 > 0 && RelativeVigorIndexValue2 > 0)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||        Stochastic Oscillato         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_StochasticOscillator()
{
   string signal = "";
   
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
         signal = "Buy";

   if(KValue0 > 80 && DValue0 > 80)
      if(KValue0 < DValue0 && KValue1 > DValue1)
         signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||     Triple Exponential Average      ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_TripleExponentialAverage()
{
   string signal = "";
   
   double TrixArray[];   
   int TrixHandler = iTriX(_Symbol, _Period, 14, PRICE_CLOSE);   
   ArraySetAsSeries(TrixArray, true);   
   CopyBuffer(TrixHandler, 0, 0, 3, TrixArray);   
   double TrixValue = TrixArray[0];
   
   if(TrixValue > 0)
      signal = "Sell";
   if(TrixValue < 0)
      signal = "Buy";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||        Williams PercentRange        ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string O_WilliamsPercentRange()
{
   string signal = "";
   
   double WPRarray[];
   int WPRdefinition = iWPR(_Symbol, _Period, 14);
   ArraySetAsSeries(WPRarray, true);
   CopyBuffer(WPRdefinition, 0, 0, 3, WPRarray);
   double WPRvalue = NormalizeDouble(WPRarray[0], 2);
   
   if(WPRvalue > -20)
      signal = "Overbought";
   if(WPRvalue < -80)
      signal = "Oversold";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||       Accumulation Distribution     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string V_AccumulationDistribution()
{
   string signal = "";
   
   double AccumulationDistributionArray[];   
   int AccumulationDistributionHandler = iAD(_Symbol, _Period, VOLUME_TICK);   
   ArraySetAsSeries(AccumulationDistributionArray, true);   
   CopyBuffer(AccumulationDistributionHandler, 0, 0, 3, AccumulationDistributionArray);
   
   signal = "Volume : " + AccumulationDistributionArray[0];
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            Money Flow Index         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string V_MoneyFlowIndex()
{
   string signal = "";
   
   double myPriceArray[];
   ArraySetAsSeries(myPriceArray, true);
   int MoneyFlowIndexDefinition = iMFI(_Symbol, _Period, 14, VOLUME_TICK);
   CopyBuffer(MoneyFlowIndexDefinition, 0, 0, 3, myPriceArray);
   double MoneyFlowIndexValue = NormalizeDouble(myPriceArray[0], 2);
   
   if(MoneyFlowIndexValue > 80) signal = "OVER BOUGHT";
   if(MoneyFlowIndexValue < 20) signal = "OVER SOLD";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            On Balance Volume        ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string V_OnBalanceVolume()
{
   string signal = "";
   
   double priceArray[];
   ArraySetAsSeries(priceArray, true);
   int OnBalanceVolumeHandler = iOBV(_Symbol, _Period, VOLUME_TICK);
   CopyBuffer(OnBalanceVolumeHandler, 0, 0, 3, priceArray);
   int OBV_Value = priceArray[0];
   signal = "Volume : " + OBV_Value;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                  Volumes            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string V_Volumes()
{
   string signal = "";
   
   double priceArray[];
   ArraySetAsSeries(priceArray, true);
   
   int VolumeHandler = iVolumes(_Symbol, _Period, VOLUME_TICK);
   CopyBuffer(VolumeHandler, 0, 0, 3, priceArray);
   
   float CurrentVolumeValue = (priceArray[0]);
   float PreviousVolumeValue = (priceArray[1]);
   
   if(CurrentVolumeValue > PreviousVolumeValue) signal = "Positive";      
   if(CurrentVolumeValue < PreviousVolumeValue) signal = "Negative";     

   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||        Accelerator Oscillator       ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string BW_AcceleratorOscillator()
{
   string signal = "";
   
   double AcceleratorOscillatorArray[];
   ArraySetAsSeries(AcceleratorOscillatorArray, true);
   int AcceleratorOscillatorHandler = iAC(_Symbol, _Period);
   CopyBuffer(AcceleratorOscillatorHandler, 0, 0, 3, AcceleratorOscillatorArray);
   double Current_AcceleratorOscillator_Value = AcceleratorOscillatorArray[0];
   double Previous_AcceleratorOscillator_Value = AcceleratorOscillatorArray[1];
   
   if(Current_AcceleratorOscillator_Value > 0 && Previous_AcceleratorOscillator_Value > Current_AcceleratorOscillator_Value)
      signal = "Long";
   if(Current_AcceleratorOscillator_Value < 0 && Previous_AcceleratorOscillator_Value < Current_AcceleratorOscillator_Value)
      signal = "Short";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                Alligator            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string BW_Alligator()
{
   string signal = "";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          Awesome Oscillator         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string BW_AwesomeOscillator()
{
   string signal = "";
   
   double priceArray[];
   ArraySetAsSeries(priceArray, true);
   int AOHandler = iAO(_Symbol, _Period);
   CopyBuffer(AOHandler, 0, 0, 3, priceArray);
   double AwesomeOscillatorValue = NormalizeDouble(priceArray[0], 6);
   
   if(AwesomeOscillatorValue > 0)
      signal = "Buy";
   if(AwesomeOscillatorValue < 0)
      signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                 Fractals            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string BW_Fractals()
{
   string signal = "";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            Gator Oscillator         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string BW_GatorOscillator()
{
   string signal = "";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||      Market Facilitation Index      ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string BW_MarketFacilitationIndex()
{
   string signal = "";
   
   double BillWilliamsMarketFacilitationIndexArray[];
   int BillWilliamsMarketFacilitationIndexHandler = iBWMFI(_Symbol, PERIOD_H1, VOLUME_TICK);
   ArraySetAsSeries(BillWilliamsMarketFacilitationIndexArray, true);
   CopyBuffer(BillWilliamsMarketFacilitationIndexHandler, 0, 0, 3, BillWilliamsMarketFacilitationIndexArray);
   double BillWilliamsMarketFacilitationIndexValue = BillWilliamsMarketFacilitationIndexArray[0];
   
   signal = BillWilliamsMarketFacilitationIndexValue;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||       Triple Moving Average         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string Custom_TripleMovingAverage()
{
   string signal = "";
   
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
   
   if(movingAverage100Array[0] > movingAverage50Array[0])
      if(movingAverage50Array[0] > movingAverage10Array[0])
         signal = "Buy";
         
   if(movingAverage100Array[0] < movingAverage50Array[0])
      if(movingAverage50Array[0] < movingAverage10Array[0])
         signal = "Sell";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          Positions Profit           ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string PositionsProfit()
{
   string signal = "";
   
   double profit = 0;
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      string symbol = PositionGetString(POSITION_SYMBOL);
      if(_Symbol == symbol)
      {
         m_position.SelectByIndex(i);
         profit += (m_position.Profit() + m_position.Swap() + m_position.Commission());
      }
   }
   
   signal = profit;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||           Sell Positions            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string SellPositions()
{
   string signal = "";
   
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
   
   signal = numberOfSellPositions;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            Buy Positions            ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string BuyPositions()
{
   string signal = "";
   
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
   
   signal = numberOfBuyPositions;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            Close Positions          ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string ClosePositions()
{  
   string signal = PositionsTotal();
    
   for(int i = PositionsTotal() -1; i >= 0; i--)
   {
      int ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
   
   signal += " positions closed";
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            Total Positions          ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string TotalPositions()
{ 
   string signal = "";
   
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
 
   int totalPositions = numberOfSellPositions + numberOfBuyPositions;
      
   signal = totalPositions;
   
   return signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            EMA Cross Over           ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string EMACrossOver()
{
   string signal = "";
   
   double myMovingAverageArray1[];
   double myMovingAverageArray2[];
   int myMovingAverageDefinition1 = iMA(_Symbol, _Period, 20, 0, MODE_EMA, PRICE_CLOSE);
   int myMovingAverageDefinition2 = iMA(_Symbol, _Period, 50, 0, MODE_EMA, PRICE_CLOSE);
   ArraySetAsSeries(myMovingAverageArray1, true);
   ArraySetAsSeries(myMovingAverageArray2, true);
   CopyBuffer(myMovingAverageDefinition1, 0, 0, 3, myMovingAverageArray1);
   CopyBuffer(myMovingAverageDefinition2, 0, 0, 3, myMovingAverageArray2);
   double myMovingAverageValue1 = myMovingAverageArray1[0];
   double myMovingAverageValue2 = myMovingAverageArray2[0];

   if(myMovingAverageArray1[0] > myMovingAverageArray2[0]
      && myMovingAverageArray1[1] < myMovingAverageArray2[1])
         signal = "BUY";
         
   if(myMovingAverageArray1[0] < myMovingAverageArray2[0]
      && myMovingAverageArray1[1] > myMovingAverageArray2[1])
         signal = "SELL";

   return signal;   
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||      Shifted Moving Average         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string ShiftedMovingAverage()
{
   string signal = "";
   
   double movingAverageArray[], shiftedMovingAverageArray[];
   ArraySetAsSeries(movingAverageArray, true);
   ArraySetAsSeries(shiftedMovingAverageArray, true);
   int movingAverageHandler = iMA(_Symbol, _Period, 50, 0, MODE_SMA, PRICE_CLOSE);
   int shiftedMovingAverageHandler = iMA(_Symbol, _Period, 50, 20, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(movingAverageHandler, 0, 0, 3, movingAverageArray);
   CopyBuffer(shiftedMovingAverageHandler, 0, 0, 3, shiftedMovingAverageArray);
   double movingAverageValue = movingAverageArray[0];
   double shiftedMovingAverageValue = shiftedMovingAverageArray[0];
   
   MqlRates PriceInfo[];
   ArraySetAsSeries(PriceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, PriceInfo);
   
   if(PriceInfo[1].close > shiftedMovingAverageValue && PriceInfo[2].close < shiftedMovingAverageValue)
      signal = "Buy";
   if(PriceInfo[1].close < shiftedMovingAverageValue && PriceInfo[2].close > shiftedMovingAverageValue)
      signal = "Sell";
   /*
      int movingAverageHandler = iMA(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE);
      int shiftedMovingAverageHandler = iMA(_Symbol, _Period, 20, 20, MODE_SMA, PRICE_CLOSE);
      CopyBuffer(movingAverageHandler, 0, 0, 3, movingAverageArray);
      CopyBuffer(shiftedMovingAverageHandler, 0, 0, 3, shiftedMovingAverageArray);
      double movingAverageValue = movingAverageArray[0];
      double shiftedMovingAverageValue = shiftedMovingAverageArray[0];
      if(movingAverageValue > shiftedMovingAverageValue)
         signal = "Buy";
      if(movingAverageValue < shiftedMovingAverageValue)
         signal = "Sell";
   */
   
   return signal;      
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||      Moving Average Crossover       ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

string EA_MA_Cross_Over(int smallMA, int bigMA)
{
   string signal = "";
   
   double smallMA_Array[], bigMA_Array[];
   ArraySetAsSeries(smallMA_Array, true);
   ArraySetAsSeries(bigMA_Array, true);
   
   int smallMA_Handler = iMA(_Symbol, _Period, smallMA, 0, MODE_SMA, PRICE_CLOSE);
   int bigMA_Handler = iMA(_Symbol, _Period, bigMA, 0, MODE_SMA, PRICE_CLOSE);
   
   CopyBuffer(smallMA_Handler, 0, 0, 3, smallMA_Array);
   CopyBuffer(bigMA_Handler, 0, 0, 3, bigMA_Array);
   
   if(bigMA_Array[1] > smallMA_Array[1] && bigMA_Array[2] < smallMA_Array[2])
      signal = "Buy";
   if(bigMA_Array[1] < smallMA_Array[1] && bigMA_Array[2] > smallMA_Array[2])
      signal = "Sell";
      
   return signal;         
}

void Trade_On_EA_MA_Cross_Over()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(EA_MA_Cross_Over(20, 50) == "Buy" && PositionsTotal() < 100)
      trade.Buy(0.01, NULL, Ask, 0, Ask + 300 * _Point, NULL);
   if(EA_MA_Cross_Over(20, 50) == "Sell" && PositionsTotal() < 100)
      trade.Sell(0.01, NULL, Bid, 0, Bid - 300 * _Point, NULL);
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||      Close All Buy Positions        ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          (Current Symbol)           ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

void CloseAllBuyPositions()
{
   for(int i = PositionsTotal() - 1; i >=0; i--)
   {
      long ticket = PositionGetTicket(i);
      int positionDirection = PositionGetInteger(POSITION_TYPE);
      string symbol = PositionGetString(POSITION_SYMBOL);
      if(symbol == _Symbol)
      {
         if(positionDirection == POSITION_TYPE_BUY)
         {
            trade.PositionClose(ticket);
         }
      }
   }
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||     Close All Sell Positions        ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          (Current Symbol)           ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

void CloseAllSellPositions()
{
   for(int i = PositionsTotal() - 1; i >=0; i--)
   {
      long ticket = PositionGetTicket(i);
      int positionDirection = PositionGetInteger(POSITION_TYPE);
      string symbol = PositionGetString(POSITION_SYMBOL);
      if(symbol == _Symbol)
      {
         if(positionDirection == POSITION_TYPE_SELL)
         {
            trade.PositionClose(ticket);
         }
      }
   }
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||      Buy Position Close Partial     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          (Current Symbol)           ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

void BuyPositionClosePartial(double Ask)
{
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      string symbol = PositionGetSymbol(i);
      if(symbol == _Symbol)
      {
         long positionTicket = PositionGetInteger(POSITION_TICKET);
         int positionDirection = PositionGetInteger(POSITION_TYPE);
         if(positionDirection == POSITION_TYPE_BUY)
         {
            if(balance < equity + 10 * _Point)
            {
               trade.PositionClosePartial(positionTicket, 0.1);
            }
         }
      }      
   }
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||     Sell Position Close Partial     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||          (Current Symbol)           ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

void SellPositionClosePartial(double Bid)
{
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      string symbol = PositionGetSymbol(i);
      if(symbol == _Symbol)
      {
         long positionTicket = PositionGetInteger(POSITION_TICKET);
         int positionDirection = PositionGetInteger(POSITION_TYPE);
         if(positionDirection == POSITION_TYPE_SELL)
         {
            if(balance < equity + 10 * _Point)
            {
               trade.PositionClosePartial(positionTicket, 0.1);
            }
         }
      }      
   }
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||   Calculate Highest Candle Price    ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

void CalculateHighestCandlePrice()
{
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int data = CopyRates(_Symbol, _Period, 0, 100, priceInformation);
   
   int highestCandle = 0;
   
   double candleArray[];
   ArraySetAsSeries(candleArray, true);
   CopyHigh(_Symbol, _Period, 0, 100, candleArray);
   highestCandle = ArrayMaximum(candleArray, 0, WHOLE_ARRAY);
   
   ObjectCreate(_Symbol, "HighestCandleLine", OBJ_HLINE, 0, 0, priceInformation[highestCandle].high);
   ObjectSetInteger(0, "HighestCandleLine", OBJPROP_COLOR, clrGreen);
   ObjectSetInteger(0, "HighestCandleLine", OBJPROP_WIDTH, 2);
   ObjectMove(0, "HighestCandleLine", 0, 0, priceInformation[highestCandle].high);
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||   Calculate Lowest Candle Price     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

void CalculateLowestCandlePrice()
{
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int data = CopyRates(_Symbol, _Period, 0, 200, priceInformation);
   
   int lowestCandle = 0;
   
   double candleArray[];
   ArraySetAsSeries(candleArray, true);
   CopyLow(_Symbol, _Period, 0, 200, candleArray);
   lowestCandle = ArrayMinimum(candleArray, 0, WHOLE_ARRAY);
   
   ObjectCreate(_Symbol, "LowestCandleLine", OBJ_HLINE, 0, 0, priceInformation[lowestCandle].low);
   ObjectSetInteger(0, "LowestCandleLine", OBJPROP_COLOR, clrRed);
   ObjectSetInteger(0, "LowestCandleLine", OBJPROP_WIDTH, 2);
   ObjectMove(0, "LowestCandleLine", 0, 0, priceInformation[lowestCandle].low);   
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||         Advanced Momentum EA        ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

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

string TradeNowOnMomentum()
{
   string signal = "";
   
   if(Check_Momentum_Entry() == "Buy" && GetTripleMovingAverageSignal() == "Buy")
   {
      signal = "Buy";     
   }
   
   if(Check_Momentum_Entry() == "Sell" && GetTripleMovingAverageSignal() == "Sell")
   {
      signal = "Sell";
   }
   
   return signal;
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
         Signal = "Buy";
         
   if(movingAverage100Array[0] < movingAverage50Array[0])
      if(movingAverage50Array[0] < movingAverage10Array[0])
         Signal = "Sell";
         
   return Signal;
}

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||         Include Source Code         ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
/*
#include "AdvancedWPR.mq5"

void OnTick()
{
   string signal = CheckEntry_WPR();
   Comment("Signal : ", signal);
}
*/

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||            Key Down Event           ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
/*
void OnChartEvent(const int id,const long& lparam,
                     const double& dparam,const string& sparam)
{
   if(id == CHARTEVENT_KEYDOWN)
   {
      short keyThatWasPressed = TranslateKey((int) lparam);
      MessageBox("The key " + ShortToString(keyThatWasPressed) + " was pressed", 
      "Key Pressed Message", MB_ABORTRETRYIGNORE);   
   }
}
*/

/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||        Simple Chart Label           ||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||                                     ||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
/*
void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   string txt = "Ask price: " + Ask;
   
   CreateLabel(txt);   
}

void CreateLabel(string txt)
{
   ObjectCreate(_Symbol, "myLabel", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "myLabel", OBJPROP_COLOR, clrRed);
   ObjectSetString(0, "myLabel", OBJPROP_FONT, "Arial");
   ObjectSetString(0, "myLabel", OBJPROP_TEXT, txt);
   ObjectSetInteger(0, "myLabel", OBJPROP_XDISTANCE, 200);
   ObjectSetInteger(0, "myLabel", OBJPROP_YDISTANCE, 200);
   ObjectSetInteger(0, "myLabel", OBJPROP_FONTSIZE, 20);
}
*/