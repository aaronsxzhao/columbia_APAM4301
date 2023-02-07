function SPaths=AssetPaths(S0,mu,sigma,T,NSteps,NRepl)
% 变量初始化
SPaths = zeros(NRepl, 1+NSteps);
% 初始价格为S0
SPaths(:,1) = S0;
% 时间间隔长度
dt = T/NSteps;
nudt = (mu-0.5*sigma^2)*dt;
sidt = sigma*sqrt(dt);
%生成随机路径
for i=1:NRepl
   for j=1:NSteps
		%模型假设对数价格与指数收益率
      SPaths(i,j+1)=SPaths(i,j)*exp(nudt + sidt*randn);
   end
end
end
