clc;
clear all;

PEEP = 5;
[t,p_a] = ode45(@(t,p_a) ode1_p_a(t,p_a),0:0.01:2,PEEP);
nu=10^(-5); % viscocity of air constant value 
l=20;
r=(2.1)/2;
R=(8*nu*l)/(pi*r^4);
Flow=500*ones(1,length(t));
Flow=Flow';
P_aw=R*Flow+p_a;
[Csum2,voltot2]=sse1_FOM(p_a);



voltot2=voltot2';
figure
plot(t,P_aw)
grid on;
xlabel('Time');
ylabel('Pressure');
title('P/T curve');
 
figure
plot(P_aw,voltot2,'r')
grid on;
xlabel('Pressure');
ylabel('Volume');
title('P/V curve');

%task 3 
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