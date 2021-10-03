#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   //Create an array for several prices
   double myExponentialMovingAverageArray1[], myExponentialMovingAverageArraay2[];
   
   //Define the properties of the exponential moving aveage array 1
   int myExponentialMovingAverage1 = iMA(_Symbol, _Period, 20, 0, MODE_EMA, PRICE_CLOSE);
   
   //Define the properties of the exponential moving average array 2
   int myExponentialMovingAverage2 = iMA(_Symbol, _Period, 50, 0, MODE_EMA, PRICE_CLOSE);
   
   //Sort the price of Exonnential Moving Average Array 1 from the current candle downwards
   ArraySetAsSeries(myExponentialMovingAverageArray1, true);
   
   //Sort the price of Exponnential Moving Average Array 2 from the current candle downwards
   ArraySetAsSeries(myExponentialMovingAverageArraay2, true);
   
   //Defined EMA, one line, current candle, 3 candles, store result
   CopyBuffer(myExponentialMovingAverage1, 0, 0, 3, myExponentialMovingAverageArray1);
   
   //Defined EMA, one line, current candle, 3 candles, stroe result
   CopyBuffer(myExponentialMovingAverage2, 0, 0, 3, myExponentialMovingAverageArraay2);
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   //Check the 20 candles EMA is above than 50 candles EMA
   if((myExponentialMovingAverageArray1[0] > myExponentialMovingAverageArraay2[0]) &&
   (myExponentialMovingAverageArray1[1] < myExponentialMovingAverageArraay2[1]))
   {
      if(countPosition() < 5)
      {
         trade.Buy(0.01, NULL, Ask, (Ask - 50 * _Point), (Ask + 100 * _Point), NULL);
      }      
   }
      
      
   if((myExponentialMovingAverageArray1[0] < myExponentialMovingAverageArraay2[0]) && 
   (myExponentialMovingAverageArray1[1] > myExponentialMovingAverageArraay2[1]))
   {
      if(countPosition() < 5)
      {
         trade.Sell(0.01, NULL, Bid, (Bid + 50 * _Point), (Bid - 100 * _Point), NULL);
      }       
   }
      
    
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