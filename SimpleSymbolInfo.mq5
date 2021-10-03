void OnTick()
{
   int Spread = SymbolInfoInteger(Symbol(), SYMBOL_SPREAD);
   
   double Ask = SymbolInfoDouble(Symbol(), SYMBOL_ASK);
   
   double Bid = SymbolInfoDouble(Symbol(), SYMBOL_BID);
   
   double lastLow = SymbolInfoDouble(Symbol(), SYMBOL_LASTLOW);
   
   double lastHigh = SymbolInfoDouble(Symbol(), SYMBOL_LASTHIGH);
   
   double minVolume = SymbolInfoDouble(Symbol(), SYMBOL_VOLUME_MIN);
   
   double maxVolume = SymbolInfoDouble(Symbol(), SYMBOL_VOLUME_MAX);
   
   double volumeStep = SymbolInfoDouble(Symbol(), SYMBOL_VOLUME_STEP);
   
   double swapLongTrade = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_LONG);
   
   double swapShortTrade = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_SHORT);
   
   Comment(
      "Spread : ", Spread, "\n",
      "Ask : ", Ask, "\n",
      "Bid : ", Bid, "\n",
      "Last Low : ", lastLow, "\n",
      "Last High : ", lastHigh, "\n",
      "Minimum Volume : ", minVolume, "\n",
      "Maximum Volume : ", maxVolume, "\n",
      "Volume Step : ", volumeStep, "\n",
      "SWAP Long Trade : ", swapLongTrade, "\n",
       "Swap Short Trade : ", swapShortTrade,"\n",
       "SWAP Long Trade : ", swapLongTrade
   );
}