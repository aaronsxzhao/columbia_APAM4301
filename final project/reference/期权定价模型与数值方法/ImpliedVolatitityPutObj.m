function f=ImpliedVolatitityPutObj(Volatility, Price, Strike, Rate, Time, Putprice)
%ImpliedVolatitityCallObj
%code by ariszheng@gmail.com 2009-8-3
%���ݲ�����ʹ��blsprice������Ȩ�۸�
[Call,Put] = blsprice(Price, Strike, Rate, Time, Volatility);
%fp(ImpliedVolatitity)=Put-Putprice=0
%Ŀ��ʹ��Ѱ��Xʹ��Ŀ�꺯��Ϊ0
f=Put-Putprice;
end
