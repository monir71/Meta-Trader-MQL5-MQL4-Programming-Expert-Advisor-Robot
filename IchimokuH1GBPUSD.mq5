#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(T_IchimokuKinkoHyo() == "Buy" && GetPositions_Buy() < 1)
      trade.Buy(0.5, NULL, Ask, 0, Ask + (300 * _Point), NULL);
      
   if(T_IchimokuKinkoHyo() == "Sell" && GetPositions_Sell() < 1)
      trade.Sell(0.5, NULL, Bid, 0, Bid - (300 * _Point), NULL);
 
   //Comment("Trend ", T_IchimokuKinkoHyo());
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

string T_IchimokuKinkoHyo()
{
   string signal = "";
   
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
   
   
   double Chikouspan_LaggingLine_LimeLine_Value = Chikouspan_Array[0];
   
   MqlRates priceInfo[];
   ArraySetAsSeries(priceInfo, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInfo);
   
   string Tenkansen_trend = "";
   
   //Checking uptrend and price close above Red Line
   if(Tenkansen_TurningLine_RedLine_Value_0 > Tenkansen_TurningLine_RedLine_Value_2 &&
      Tenkansen_TurningLine_RedLine_Value_2 > Tenkansen_TurningLine_RedLine_Value_4 &&
      Tenkansen_TurningLine_RedLine_Value_4 > Tenkansen_TurningLine_RedLine_Value_6 && 
      priceInfo[1].close > Tenkansen_TurningLine_RedLine_Value_0)
   {
      Tenkansen_trend = "Up";
   }
   
   //Checking downtrend and price close below Red Line
   if(Tenkansen_TurningLine_RedLine_Value_0 < Tenkansen_TurningLine_RedLine_Value_2 &&
      Tenkansen_TurningLine_RedLine_Value_2 < Tenkansen_TurningLine_RedLine_Value_4 &&
      Tenkansen_TurningLine_RedLine_Value_4 < Tenkansen_TurningLine_RedLine_Value_6 &&
      priceInfo[1].close < Tenkansen_TurningLine_RedLine_Value_0)
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
   
   return SenkouSpan_trend;
}