void OnTick()
{
   double priceArray[];
   ArraySetAsSeries(priceArray, true);
   int OnBalanceVolumeHandler = iOBV(_Symbol, _Period, VOLUME_TICK);
   CopyBuffer(OnBalanceVolumeHandler, 0, 0, 3, priceArray);
   int OBV_Value = priceArray[0];
   Comment("On Balance Volume Value : ", OBV_Value);
}