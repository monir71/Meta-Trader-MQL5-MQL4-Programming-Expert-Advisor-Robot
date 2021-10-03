void OnTick()
{
   MqlRates PriceInformation[];

   ArraySetAsSeries(PriceInformation, true);
   
   int Data = CopyRates(Symbol(), Period(), 0, Bars(_Symbol, _Period), PriceInformation);
   
   if(PriceInformation[1].open == PriceInformation[1].close)
   {
      Comment("DOJI");
   }
   else
   {
      Comment("");
   }
}