function f=ImpliedVolatitityPutObj(Volatility, Price, Strike, Rate, Time, Putprice)
%ImpliedVolatitityCallObj
%code by ariszheng@gmail.com 2009-8-3
%根据参数，使用blsprice计算期权价格
[Call,Put] = blsprice(Price, Strike, Rate, Time, Volatility);
%fp(ImpliedVolatitity)=Put-Putprice=0
%目标使得寻找X使得目标函数为0
f=Put-Putprice;
end
