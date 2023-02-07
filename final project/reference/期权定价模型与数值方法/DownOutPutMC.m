function [P,aux,ci]=DownOutPutMC(s0,E,r,T, sigma,sb,Nsteps,Nrep1)
dt=T/Nsteps;
nudt=(r-0.5*sigma^2)*dt;
sidt=sigma*sqrt(dt);
randn('seed',0);
rand=randn(Nrep1,Nsteps);
rand1=nudt+sidt*rand;
% 沿列方向逐列累加
rand2=cumsum(rand1,2); 
path=s0*exp(rand2);
% 设定现金流初值为0
payoff=zeros(Nrep1,1);  
for i=1:Nrep1
ax=path(i,:);
if min(ax)<sb 
    % 如果路径中的任意一点价格低于障碍值，现金流为0
     payoff(i)=0;
else 
      payoff(i)=max(0,E-ax(Nsteps));
end
end
[P,aux,ci]=normfit(exp(-r*T)*payoff);
end
