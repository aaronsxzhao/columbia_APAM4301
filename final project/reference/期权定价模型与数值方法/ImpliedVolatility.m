function [Vc,Vp,Cfval,Pfval]= ImpliedVolatility( Price, Strike, Rate,Time, CallPrice, PutPrice)
%ImpliedVolatility
%�Ż��㷨��ʼ������;
Volatility0=1.0;
%CallPrice��Ӧ������������
[Vc,Cfval] =fsolve(@(Volatility) ImpliedVolatitityCallObj(Volatility, Price, Strike,Rate, Time, CallPrice),Volatility0);
%CallPrice��Ӧ������������
[Vp,Pfval] =fsolve(@(Volatility) ImpliedVolatitityPutObj(Volatility, Price, Strike, Rate, Time, PutPrice),Volatility0);
end
