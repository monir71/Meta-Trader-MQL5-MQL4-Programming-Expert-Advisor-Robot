#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
{
   //get the ask price
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   //Set object properties for a label
   ObjectCreate(_Symbol, "Label1", OBJ_LABEL, 0, 0, 0);
   
   ObjectSetString(0, "Label1", OBJPROP_FONT, "Arial");
   
   ObjectSetString(0, "Label1", OBJPROP_TEXT, "Ask Value : " + Ask);
   
   ObjectSetInteger(0, "Label1", OBJPROP_XDISTANCE, 20);
   
   ObjectSetInteger(0, "Label1", OBJPROP_YDISTANCE, 20);
   
   ObjectSetInteger(0, "Label1", OBJPROP_FONTSIZE, 20);  
   
}