clear 
clc
PEEP = 0;
PIP = 50;
OpMin = 0;
OpMax = 5;
OPConst = 25; 
dt = 0.01;

std = [1 2 3 4]; 
figure
for i = 1:length(std)
[Csum2,voltot2f,time_Recr,P_alv] = sse3(OpMin,OpMax,OPConst,dt,PEEP,PIP,std(i));
plot(Csum2,P_alv)
xlabel("Compliance")
ylabel("Pressure")
hold on 
title ('The effect of different standard deviations')
legend('std=1','std=2','std=3','std=4','location','northwest')
end

figure
Open_Range = OpMin:OpMax;
p = normcdf(Open_Range,mean(Open_Range),1);
plot(Open_Range,p*100)
xlabel(" TOP presure")
ylabel("percentage %")
title ( 'Gaussian probability distribution' )







