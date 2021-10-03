#include<Trade\Trade.mqh>
CTrade trade;

//Import file
#include "AdvfanceEMAcrossOver.mq5";

static double profit = AccountInfoDouble(ACCOUNT_BALANCE) * 2;

void OnTick()
{
   string signal = checkEntry();
     
   double Bid = NormalizeDouble(SymbolInfoDouble(Symbol(), SYMBOL_BID), _Digits);
   double Ask = NormalizeDouble(SymbolInfoDouble(Symbol(), SYMBOL_ASK), _Digits);
   
   if(countPosition() < 10)
   {
      Comment("Signnal : ");
      if(profit >= AccountInfoDouble(ACCOUNT_BALANCE))
      {
         if(signal == "BUY")
            trade.Buy(0.01, NULL, Ask, 0, Ask + 100 * _Point, NULL);
      }   
   }
      
   //if(signal == "SELL")
      //trade.Sell(0.01, NULL, Bid, 0, Bid - 100 * _Point, NULL);
}

int countPosition()
{
   int PositionsForThisSymbol = 0;

	for(int i = PositionsTotal() - 1; i >= 0; i--)
	{
		string symbol = PositionGetSymbol(i);

		if(Symbol() == symbol)
		{
			PositionsForThisSymbol += 1;
		}
	}
	return PositionsForThisSymbol;
}