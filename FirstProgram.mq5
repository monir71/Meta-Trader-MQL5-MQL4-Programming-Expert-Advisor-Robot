#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
  {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
      double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
      
      if(Equity >= Balance)
      trade.Sell((0.10, NULL, Bid, 0, (Bid - 100 * _Point), NULL);
  }

