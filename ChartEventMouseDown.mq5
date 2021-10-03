void OnChartEvent(const int id,
                  const long& lparam,
                  const double& dparam,
                  const string& sparam)
{
   if(id == CHARTEVENT_KEYDOWN)
   {
      int keyPressed = TranslateKey((int) lparam);
      MessageBox("Key that was pressed is " + ShortToString(keyPressed),
         "Key Pressed Message",
         MB_CANCELTRYCONTINUE);
   }
}