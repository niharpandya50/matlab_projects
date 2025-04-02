clc;
clear all;

PEEP = 5;
[t,p_a] = ode45(@(t,p_a) ode1_p_a(t,p_a),0:0.01:1,PEEP);
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







