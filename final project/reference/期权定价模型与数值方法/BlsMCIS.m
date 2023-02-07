function [Price,VarPrice,CI] = BlsMCIS(S0,K,r,T,sigma,NRepl)
%���������״̬
randn('state',0);
%���ɲ����˶�·��
nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);
ISnuT = log(K/S0) - 0.5*sigma^2*T;
%���ɷ���N��0��1���������
Veps = randn(NRepl,1);
VY = ISnuT + siT*Veps;
ISRatios = exp( (2*(nuT - ISnuT)*VY - nuT^2 + ISnuT^2)/2/siT^2);
%�����ʼ���
DiscPayoff = exp(-r*T)*max(0, (S0*exp(VY)-K));
%����̬�ֲ�����normfit��ģ�����������
[Price, VarPrice, CI] = normfit(DiscPayoff.*ISRatios);
end
