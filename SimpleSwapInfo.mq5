#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
  {
      double SwapLongTrades = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_LONG);
      double SwapShortTrades = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_SHORT);
      
      Comment("Swap for Long trades: ", SwapLongTrades, "\n\n", "Swap for short trades: ", SwapShortTrades);
  }