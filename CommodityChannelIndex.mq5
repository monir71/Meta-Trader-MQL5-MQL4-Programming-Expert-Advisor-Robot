void OnTick()
{
   double myPriceArray[];
   int CommodityChannelIndexDefinition = iCCI(_Symbol, _Period, 14, PRICE_CLOSE);
   ArraySetAsSeries(myPriceArray, true);
   CopyBuffer(CommodityChannelIndexDefinition, 0, 0, 3, myPriceArray);
   double CommodityChannelIndexValue = myPriceArray[0];
   
   if(CommodityChannelIndexValue > 100) Comment("OVERBOUGTH");
   if(CommodityChannelIndexValue < -100) Comment("OVERSOLD");
   if(CommodityChannelIndexValue < 100 && CommodityChannelIndexValue > -100) Comment("");
}