void OnTick()
{
   string myTime;
   myTime = GetTime();
   Comment(myTime);
}

string GetTime()
{
   string GetTimeWithSeconds;
   GetTimeWithSeconds = TimeToString(TimeLocal(), TIME_DATE|TIME_SECONDS);
   return GetTimeWithSeconds;
}