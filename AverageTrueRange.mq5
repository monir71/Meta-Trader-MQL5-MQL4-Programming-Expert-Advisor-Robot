void OnTick()
{
   double AverageTrueRangeArray[];
   int AverageTrueRangeDefinition = iATR(_Symbol, _Period, 14);
   ArraySetAsSeries(AverageTrueRangeArray, true);
   CopyBuffer(AverageTrueRangeDefinition, 0, 0, 3, AverageTrueRangeArray);
   double AverageTrueRangeValue = NormalizeDouble(AverageTrueRangeArray[0], 5);
   
   if(AverageTrueRangeValue > 0.00024) Comment("STRONG Average True Range Value. ATR : ", AverageTrueRangeValue);
   if(AverageTrueRangeValue < 0.00014) Comment("WEAK Average True Range Value. ATR : ", AverageTrueRangeValue);
   
   if(AverageTrueRangeValue > 0.00014 && AverageTrueRangeValue < 0.00014)
      Comment("ATR : ", AverageTrueRangeValue);
}