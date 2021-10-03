void OnChartEvent(const int id, const long& lParam, const double& dParam, const string& sParam)
{
   if(id==CHARTEVENT_CLICK)
   {
      MessageBox("Chart was clicked X-Value: " + lParam + " Y-Value: " + 
         dParam, "Mouse click Message", MB_OKCANCEL);
   }
}
