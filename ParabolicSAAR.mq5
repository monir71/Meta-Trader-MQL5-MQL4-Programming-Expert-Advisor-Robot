void OnTick()
{    
   Comment("Parabolic SAR Signal: ", GetSignalParabolicSAR());
}

string GetSignalParabolicSAR()
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