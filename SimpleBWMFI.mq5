void OnTick()
{
   double BillWilliamsMarketFacilitationIndexArray[];
   int BillWilliamsMarketFacilitationIndexHandler = iBWMFI(_Symbol, PERIOD_H1, VOLUME_TICK);
   ArraySetAsSeries(BillWilliamsMarketFacilitationIndexArray, true);
   CopyBuffer(BillWilliamsMarketFacilitationIndexHandler, 0, 0, 3, BillWilliamsMarketFacilitationIndexArray);
   double BillWilliamsMarketFacilitationIndexValue = BillWilliamsMarketFacilitationIndexArray[0];
   Comment("Bill Williams Market Facilitation Index Value : ", BillWilliamsMarketFacilitationIndexValue);
}