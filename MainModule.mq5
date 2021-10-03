#import "MyLibrary.ex5"
   void OpenBuyStop();
   double GetProfitCurrencyPair();
#import

void OnTick()
{
   if(PositionsTotal() == 0)
      OpenBuyStop();
   
   double profit = GetProfitCurrencyPair();
   Comment("Profit : ", profit);
}
   
