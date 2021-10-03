void OnTick()
  {
      //Create an array
      MqlRates PriceInformation[];
      
      //Sort it from current candle to older candle
      ArraySetAsSeries(PriceInformation, true);
      
      //Copy price data into the array
      int Data = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()), PriceInformation);
      
      if(PriceInformation[1].close > PriceInformation[2].close)
      {
         Comment("Price is UP");
      }
      
      if(PriceInformation[1].close < PriceInformation[2].close)
      {
         Comment("Price is DOWN");
      }
  }