#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   if(CheckEntry_AwesomeOscillator() == "Buy" && PositionsTotal() < 1)
      trade.Buy(0.1, NULL, Ask, 0, Ask + 300 * _Point, NULL);
   
   if(CheckEntry_AwesomeOscillator() == "Sell" && PositionsTotal() < 1)
      trade.Sell(0.1, NULL, Bid, 0, Bid - 300 * _Point, NULL);
   
   Comment("Awesome Oscillator Signal : ", CheckEntry_AwesomeOscillator());
   
}

string CheckEntry_AwesomeOscillator()
{
   string signal = "";
   
   double priceArray[];
   ArraySetAsSeries(priceArray, true);
   int AOHandler = iAO(_Symbol, _Period);
   CopyBuffer(AOHandler, 0, 0, 3, priceArray);
   double AwesomeOscillatorValue = NormalizeDouble(priceArray[0], 6);
   
   if(AwesomeOscillatorValue > 0)
      signal = "Buy";
   if(AwesomeOscillatorValue < 0)
      signal = "Sell";
      
   return signal;
}