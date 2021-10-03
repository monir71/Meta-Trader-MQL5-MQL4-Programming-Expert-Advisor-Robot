#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   //|||||||||||||||||||||||||||||||||||||||||||||||||||
   //|||       Four (04) Moving Average              |||     
   //|||||||||||||||||||||||||||||||||||||||||||||||||||

   double movingAverageArray1[];
   double movingAverageArray2[];
   double movingAverageArray3[];
   double movingAverageArray4[];
   
   int movingAverageHandler1 = iMA(_Symbol, _Period, 50, 0, MODE_EMA, PRICE_CLOSE);
   int movingAverageHandler2 = iMA(_Symbol, _Period, 100, 0, MODE_EMA, PRICE_CLOSE);
   int movingAverageHandler3 = iMA(_Symbol, _Period, 150, 0, MODE_EMA, PRICE_CLOSE);
   int movingAverageHandler4 = iMA(_Symbol, _Period, 200, 0, MODE_EMA, PRICE_CLOSE);
   
   ArraySetAsSeries(movingAverageArray1, true);
   ArraySetAsSeries(movingAverageArray2, true);
   ArraySetAsSeries(movingAverageArray3, true);
   ArraySetAsSeries(movingAverageArray4, true);
   
   CopyBuffer(movingAverageHandler1, 0, 0, 3, movingAverageArray1);
   CopyBuffer(movingAverageHandler2, 0, 0, 3, movingAverageArray2);
   CopyBuffer(movingAverageHandler3, 0, 0, 3, movingAverageArray3);
   CopyBuffer(movingAverageHandler4, 0, 0, 3, movingAverageArray4);
   
   double movingAverageValue1 = movingAverageArray1[0];
   double movingAverageValue2 = movingAverageArray2[0];
   double movingAverageValue3 = movingAverageArray3[0];
   double movingAverageValue4 = movingAverageArray4[0];
   
   //|||||||||||||||||||||||||||||||||||||||||||||||||||
   //|||             Price Information               |||     
   //|||||||||||||||||||||||||||||||||||||||||||||||||||
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, 3, priceInformation);
   
   //|||||||||||||||||||||||||||||||||||||||||||||||||||
   //|||          Preparing to Trade                 |||     
   //|||||||||||||||||||||||||||||||||||||||||||||||||||
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   //|||||||||||||||||||||||||||||||||||||||||||||||||||
   //|||       Verifying Conditions                  |||     
   //|||||||||||||||||||||||||||||||||||||||||||||||||||
   
   if(movingAverageValue1 > movingAverageValue2 && 
      movingAverageValue2 > movingAverageValue3 && 
         movingAverageValue3 > movingAverageValue4 &&
            movingAverageValue4 < priceInformation[0].close &&
               movingAverageValue4 > priceInformation[1].close)
   {
      if(PositionsTotal() < 100)
      {
         trade.Buy(0.01, NULL, Ask, 0, Ask + (200 * _Point), NULL);  
      }
   }
   
   if(movingAverageValue1 < movingAverageValue2 && 
      movingAverageValue2 < movingAverageValue3 && 
         movingAverageValue3 < movingAverageValue4 &&
            movingAverageValue4 > priceInformation[0].close &&
               movingAverageValue4 < priceInformation[1].close)
   {
      if(PositionsTotal() < 100)
      {
         trade.Sell(0.01, NULL, Bid, 0, Bid - (200 * _Point), NULL);  
      }
   }  
   
   Comment("Moving Aveage Value 1: ", movingAverageValue1,
      "Moving Aveage Value 2 : ", movingAverageValue2,
      "Moving Aveage Value 3 :  ", movingAverageValue3,
      "Moving Aveage Value 4: ", movingAverageValue4);         
}