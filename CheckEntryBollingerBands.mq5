#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   BuyNow();
   SellNow();
}

void SellNow()
{
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   //Sell
   if(getRSI() > 70.00)
   {
      if(getMomentum() > 100.10)
      {
         if(getWilliamsPercentRange() > -1.00)
         {
            if(getCommodityChannelIndex() > 170.00)
            {
               if(getDeMarker() > 0.75)
               {
                  if(checkEntryEMA() == "SELL")
                  {
                     if(CheckEntryBollinngerBands() == "Sell")
                     {
                        if(countPosition() < 100)
                        {
                           trade.Sell(0.03, NULL, Bid, Bid + 1000 * _Point, Bid - 300 * _Point, NULL);   
                        }                        
                     }                     
                  }                  
               }
            }
         }         
      }
   }
   
}

void BuyNow()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   //Buy
   if(getRSI() < 30.00)
   {
       if(getMomentum() < 99.80)
      {
         if(getWilliamsPercentRange() < -99.00)
         {
            if(getCommodityChannelIndex() < -170.00)
            {
               if(getDeMarker() < 0.25)
               {
                  if(checkEntryEMA() == "BUY")
                  {
                     if(CheckEntryBollinngerBands() == "Buy")
                     {
                        if(countPosition() < 100)
                        {
                           trade.Buy(0.01, NULL, Ask, 0, Ask + 100 * _Point, NULL);        
                        }  
                     }                       
                  }                    
               }               
            }            
         }           
      }  
   }
}

string CheckEntryBollinngerBands()
{
   //We create an array for the prices
   MqlRates PriceInfo[];
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(PriceInfo, true);
   
   //We fill the array with price data
   //For all candles in the chart: int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), PriceInfo);
   int Data = CopyRates(Symbol(), Period(), 0, 3, PriceInfo);
   
   //Create a string variable for the signal
   string signal = "";
   
   //Create arrays for prices
   double UpperBandsArray[];
   double MiddleBandArray[];
   double LowerBandArray[];
   
   //Define Bollinnger Bands
   int BollinngerBandsDefinition = iBands(_Symbol, _Period, 20, 0, 2, PRICE_CLOSE);
   
   //Copy price info into the arrays
   CopyBuffer(BollinngerBandsDefinition, 0, 0, 3, MiddleBandArray);
   CopyBuffer(BollinngerBandsDefinition, 1, 0, 3, UpperBandsArray);
   CopyBuffer(BollinngerBandsDefinition, 2, 0, 3, LowerBandArray);
   
   //Calculate EA for the last candle
   double MiddleBandValueLast = MiddleBandArray[0];
   double UpperBandValueLast = UpperBandsArray[0];
   double LowerBandValueLast = LowerBandArray[0];
   
   //Calculate EA for the last but one candle
   double MiddleBandValueLastButOne = MiddleBandArray[1];
   double UpperBandValueLastButOne = UpperBandsArray[1];
   double LowerBandValueLastButOne = LowerBandArray[1];
   
   //Buy signal
   if(PriceInfo[1].close < LowerBandValueLastButOne && PriceInfo[0].close > LowerBandValueLast)
   signal = "Buy";
   
   //Sell Signal
   if(PriceInfo[1].close > UpperBandValueLastButOne && PriceInfo[0].close < UpperBandValueLast)
   signal = "Sell";
   
   return signal;
   
}

int countPosition()
{
   int PositionsForThisSymbol = 0;

	for(int i = PositionsTotal() - 1; i >= 0; i--)
	{
		string symbol = PositionGetSymbol(i);

		if(Symbol() == symbol)
		{
			PositionsForThisSymbol += 1;
		}
	}
	return PositionsForThisSymbol;
}

double getRSI()
{
   //create an array for several prices
   double myRSIarray[];
  
   //Define the properties of the RSI
   int myRSIdefinition = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
  
   //sort the price array from the current candle downwards
   ArraySetAsSeries(myRSIarray, true);
  
   //Defined EA, current candle, 3 candles, store result
   CopyBuffer(myRSIdefinition, 0, 0, 3, myRSIarray);
  
   //calculate EA for the current candle
   double myRSIvalue = NormalizeDouble(myRSIarray[0], 2);
  
   return myRSIvalue;
}

double getMomentum()
{
   //Create a price array
   double myPriceArray[];
   
   //Define the properties of the Momentum EA
   double iMomentumDefinition = iMomentum(_Symbol, _Period, 14, PRICE_CLOSE);
   
   //Sort the price array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   //Defined Momentum, 1 line, current candle, 3 cnadles, strore in array
   CopyBuffer(iMomentumDefinition, 0, 0, 3, myPriceArray);
   
   //Get the value of the current candle
   double myMomentumValue = NormalizeDouble(myPriceArray[0], _Digits);
   
   return myMomentumValue;
   
   //Chart output depending on the value
   //if(myMomentumValue > 100.0) Comment("STRONG MOMENTUM: ", myMomentumValue);
   //if(myMomentumValue < 99.9) Comment("WEAK MOMENTUM: ", myMomentumValue);
   //if(myMomentumValue <100.0 && myMomentumValue > 99.9) Comment("", myMomentumValue);
}

double getWilliamsPercentRange()
{
   double WPRarray[];
   int WPRdefinition = iWPR(_Symbol, _Period, 14);
   ArraySetAsSeries(WPRarray, true);
   CopyBuffer(WPRdefinition, 0, 0, 3, WPRarray);
   double WPRvalue = NormalizeDouble(WPRarray[0], 2);
   
   return WPRvalue;
   
   //Comment("WPR Value: ", WPRvalue);
}

double getCommodityChannelIndex()
{
   double myPriceArray[];
   int CommodityChannelIndexDefinition = iCCI(_Symbol, _Period, 14, PRICE_CLOSE);
   ArraySetAsSeries(myPriceArray, true);
   CopyBuffer(CommodityChannelIndexDefinition, 0, 0, 3, myPriceArray);
   double CommodityChannelIndexValue = myPriceArray[0];
   
   return CommodityChannelIndexValue;
   
   //if(CommodityChannelIndexValue > 100) Comment("OVERBOUGTH");
   //if(CommodityChannelIndexValue < -100) Comment("OVERSOLD");
   //if(CommodityChannelIndexValue < 100 && CommodityChannelIndexValue > -100) Comment("");
}

double getDeMarker()
{
   //Create an array of several prices
   double myPriceArray[];
   
   //Define the properties of DeMarker EA
   int DemarkerDefinition = iDeMarker(_Symbol, _Period, 14);
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(myPriceArray, true);
   
   //Define EA, one line, current candle, 3 candles, store result
   CopyBuffer(DemarkerDefinition, 0, 0, 3, myPriceArray);
   
   //Get the Value
   double DeMarkerValue = myPriceArray[0];
   
   return DeMarkerValue;
   
   //if(DeMarkerValue > 0.7) Comment("Strong Trend: ", DeMarkerValue);
   //if(DeMarkerValue < 0.3) Comment("Weak Trend: ", DeMarkerValue);
   //if(DeMarkerValue < 0.7 && DeMarkerValue > 0.3) Comment("");
}

string checkEntryEMA()
{
   //Create an empty string
   string entry = "";
   
   //Create two array of several prices
   double myMovingAverageArray1[];
   double myMovingAverageArray2[];
   
   //Define the properties of moving average 1
   int myMovingAverageDefinition1 = iMA(_Symbol, _Period, 20, 0, MODE_EMA, PRICE_CLOSE);
   
   //Define the properties of moving average 2
   int myMovingAverageDefinition2 = iMA(_Symbol, _Period, 50, 0, MODE_EMA, PRICE_CLOSE);
   
   //Sort the price array 1 from the current candle downwards
   ArraySetAsSeries(myMovingAverageArray1, true);
   
   //Sort the price array 2 from the current candle downwards
   ArraySetAsSeries(myMovingAverageArray2, true);
   
   //Define MA1 EA, one line, current candle, 3 candles, store result
   CopyBuffer(myMovingAverageDefinition1, 0, 0, 3, myMovingAverageArray1);
   
   //Define MA2 EA, one line, current candle, 3 candles, store result
   CopyBuffer(myMovingAverageDefinition2, 0, 0, 3, myMovingAverageArray2);
   
   //Calculate MA1 for the current candle
   double myMovingAverageValue1 = myMovingAverageArray1[0];
   
   //Calculate MA2 for the current candle
   double myMovingAverageValue2 = myMovingAverageArray2[0];
   
   //Check if the 20 candles EA is over the 50 candles EA
   if(myMovingAverageArray1[0] > myMovingAverageArray2[0]
      && myMovingAverageArray1[1] < myMovingAverageArray2[1])
         entry = "BUY";
         
   if(myMovingAverageArray1[0] < myMovingAverageArray2[0]
      && myMovingAverageArray1[1] > myMovingAverageArray2[1])
         entry = "SELL";
         
   //Return the entry signal
   return entry;   
}