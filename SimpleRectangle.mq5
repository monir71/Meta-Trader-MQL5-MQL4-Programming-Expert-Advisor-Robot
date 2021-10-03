void OnTick()
{
   double highestCandleArray[];
   double lowestCandleArray[];
   
   ArraySetAsSeries(highestCandleArray, true);
   ArraySetAsSeries(lowestCandleArray, true);
   
   CopyHigh(_Symbol, _Period, 0, 30, highestCandleArray);
   CopyLow(_Symbol, _Period, 0, 30, lowestCandleArray);
   
   int highestCandleIndex = ArrayMaximum(highestCandleArray, 0, WHOLE_ARRAY);
   int lowestCandleIndex = ArrayMinimum(lowestCandleArray, 0, WHOLE_ARRAY);
   
   MqlRates priceInformation[];
   ArraySetAsSeries(priceInformation, true);
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   ObjectDelete(_Symbol, "Rectangle");
   
   ObjectCreate(
      _Symbol,
      "Rectangle",
      OBJ_RECTANGLE,
      0,
      priceInformation[30].time,
      priceInformation[highestCandleIndex].high,
      priceInformation[0].time,
      priceInformation[lowestCandleIndex].low      
   );
   
   ObjectSetInteger(0, "Rectangle", OBJPROP_COLOR, clrBlue);
   ObjectSetInteger(0, "Rectangle", OBJPROP_FILL, clrBlue);  
   
}