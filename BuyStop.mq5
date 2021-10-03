#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   //Buy stop, 10 microlots, 100 points above Ask, no SL, 300 points TP, no expiration, no date, no comment
   if(balance == equity)
      trade.BuyStop(0.10, Ask + 100 * _Point, _Symbol, 0, Ask + 300 * _Point, ORDER_TIME_GTC, 0, 0);
}