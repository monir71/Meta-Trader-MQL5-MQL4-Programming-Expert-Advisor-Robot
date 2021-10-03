void OnChartEvent(const int id,const long& lparam,const double& dparam,const string& sparam)
  {
      if(id == CHARTEVENT_CLICK)
      {
         Comment("You pressed pouse at X=", lparam, " and Y=", dparam);
      }
  }