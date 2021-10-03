#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   datetime time = TimeLocal();
   
   string HoursAndMinutes = TimeToString(time, TIME_MINUTES);
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   if(PositionsTotal() == 0 && StringSubstr(HoursAndMinutes, 0, 5) == "15:00")
   {
      trade.Buy(0.1, NULL, Ask, 0, Ask + 300 * _Point, NULL);
   }
   
   Comment(HoursAndMinutes);
}