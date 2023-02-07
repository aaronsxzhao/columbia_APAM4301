function SPaths=AssetPaths(S0,mu,sigma,T,NSteps,NRepl)
% ������ʼ��
SPaths = zeros(NRepl, 1+NSteps);
% ��ʼ�۸�ΪS0
SPaths(:,1) = S0;
% ʱ��������
dt = T/NSteps;
nudt = (mu-0.5*sigma^2)*dt;
sidt = sigma*sqrt(dt);
%�������·��
for i=1:NRepl
   for j=1:NSteps
		%ģ�ͼ�������۸���ָ��������
      SPaths(i,j+1)=SPaths(i,j)*exp(nudt + sidt*randn);
   end
end
end
