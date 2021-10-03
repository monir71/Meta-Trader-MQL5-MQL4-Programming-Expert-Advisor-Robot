void OnTick()
{
   //Create a price array
   MqlRates priceInformation[];
   
   //Sort the array from the current candle downwards
   ArraySetAsSeries(priceInformation, true);
   
   //Copy data into the array
   int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), priceInformation);
   
   //Static counter
   static int i;
   
   
   //Create the object of Arrow
   ObjectCreate(_Symbol, "myArrow", OBJ_ARROW, 0, TimeCurrent(), priceInformation[0].high);
   
   ObjectSetInteger(0, "myArrow", OBJPROP_WIDTH, 20);
   ObjectSetInteger(0, "myArrow", OBJPROP_ARROWCODE, i);
   ObjectSetInteger(0, "myArrow", OBJPROP_COLOR, clrBlue);
   
   //Move the object to the current candle high
   ObjectMove(_Symbol, "myArrow", 0, TimeCurrent(), priceInformation[0].high);
   
   //Chart output for the current counter value
   Comment("i has the value : ", i);
   
   i++;
}