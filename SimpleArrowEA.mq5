#include<Trade\Trade.mqh>
CTrade trade;

static int buyCounter = 0;
static int sellCounter = 0;

void OnTick()
{
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   int numberOfCandles = Bars(Symbol(), Period());
   string numberOfCandlesText = IntegerToString(numberOfCandles);
   
   int highestCandleNumber = iHighest(NULL, 0, MODE_HIGH, 200, 1);
   int lowestCandleNumber = iLowest(NULL, 0, MODE_LOW, 200, 1);
   
   double highestPrice = priceInformation[highestCandleNumber].high;
   double lowestPrice = priceInformation[lowestCandleNumber].low;
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   //|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   //|||||||||||||||||                  Buy Counter                       ||||||||||||||||
   //|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   
   if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 0)
   {
      while(buyCounter < 10)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);
         buyCounter++;  
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 10)
   {
      while(buyCounter < 20)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);
         buyCounter++;   
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 20)
   {
      while(buyCounter < 30)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL); 
         buyCounter++;  
      }          
   }   
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 30)
   {
      while(buyCounter < 40)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);   
         buyCounter++;
      }          
   }      
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 40)
   {
      while(buyCounter < 50)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);   
         buyCounter++;
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 50)
   {
      while(buyCounter < 60)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);
         buyCounter++;   
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 60)
   {
      while(buyCounter < 70)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL); 
         buyCounter++;  
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 70)
   {
      while(buyCounter < 80)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);
         buyCounter++;   
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 80)
   {
      while(buyCounter < 90)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);
         buyCounter++;   
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 90)
   {
      while(buyCounter < 100)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (30 * _Point), NULL);
         buyCounter++;   
      }          
   }
   else if(priceInformation[0].low < lowestPrice && GetPositions_Buy() == 100)
   {
      buyCounter = 0;
   }
   else
   {
      //buyCounter = 0;
   }
   
   //|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   //|||||||||||||||||                  Sell Counter                      ||||||||||||||||
   //|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   
   if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 0)
   {
      while(sellCounter < 10)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;  
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 10)
   {
      while(sellCounter < 20)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;   
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 20)
   {
      while(sellCounter < 30)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;  
      }          
   }   
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 30)
   {
      while(sellCounter < 40)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;
      }          
   }      
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 40)
   {
      while(sellCounter < 50)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 50)
   {
      while(sellCounter < 60)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;   
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 60)
   {
      while(sellCounter < 70)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;  
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 70)
   {
      while(sellCounter < 80)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;   
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 80)
   {
      while(sellCounter < 90)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;   
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 90)
   {
      while(sellCounter < 100)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
         sellCounter++;   
      }          
   }
   else if(priceInformation[0].high > highestPrice && GetPositions_Sell() == 100)
   {
      sellCounter = 0;
   }
   else
   {
      //sellCounter = 0;
   }
   
   /*
   while(GetPositions_Buy() < 100)
   {
      //ObjectCreate(0, numberOfCandlesText, OBJ_ARROW_BUY, 0, TimeCurrent(), (priceInformation[0].low));
          
      
   }      
   
   while(priceInformation[0].high > highestPrice && GetPositions_Sell() < 100)
   {
      //ObjectCreate(0, numberOfCandlesText, OBJ_ARROW_SELL, 0, TimeCurrent(), (priceInformation[0].high));
      trade.Sell(0.01, NULL, Bid, 0, Bid - (30 * _Point), NULL);
   }
   */      
   
   Comment("Number of Candles : ", numberOfCandles,
            "\nHighest Candle Number : ", highestCandleNumber,
            "\nHighest Price : ", highestPrice,
            "\nLowest Candle Number : ", lowestCandleNumber,
            "\nLowest Price : ", lowestPrice,
            "\nTotal Buy Positions : ", GetPositions_Buy(),
            "\nTotal Sell Positions : ", GetPositions_Sell(),
            "\nAccount Balance : ", AccountInfoDouble(ACCOUNT_BALANCE),
            "\nAccount Equity : ", AccountInfoDouble(ACCOUNT_EQUITY),
            "\nAccount Profit : ", AccountInfoDouble(ACCOUNT_PROFIT),
            "\nTotal Positions : ", PositionsTotal(),
            "\nBuy Counter : ", buyCounter,
            "\nSell Counter : ", sellCounter
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