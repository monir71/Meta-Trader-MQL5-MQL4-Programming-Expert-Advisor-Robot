#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   int ExternalFile = FileOpen("Signal.txt", FILE_READ|FILE_ANSI|FILE_COMMON, "|", CP_ACP);
   
   string BuySignal = FileReadString(ExternalFile);
   
   FileClose(ExternalFile);
   
   if(PositionsTotal() == 0 && BuySignal == "BUY IT NOW")
   {
      trade.Buy(0.01, NULL, Ask, 0, Ask + 100 * _Point, NULL);    
   }
}