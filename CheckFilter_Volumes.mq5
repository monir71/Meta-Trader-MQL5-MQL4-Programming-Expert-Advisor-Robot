string CheckFilter_Volumes()
{
   string filter = "";
   
   double priceArray[];
   ArraySetAsSeries(priceArray, true);
   
   int VolumeHandler = iVolumes(_Symbol, _Period, VOLUME_TICK);
   CopyBuffer(VolumeHandler, 0, 0, 3, priceArray);
   
   float CurrentVolumeValue = (priceArray[0]);
   float PreviousVolumeValue = (priceArray[1]);
   
   if(CurrentVolumeValue > PreviousVolumeValue)
   {
      filter = "Positive"; 
   }
      
   if(CurrentVolumeValue < PreviousVolumeValue)
   {
      filter = "Negative";
   }      
   
   return filter;
}