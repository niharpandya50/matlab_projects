% function that cal.. airway pressure using task 2

TOP = 10;
N = 30;
SP = 0:0.5:14.5;
Cfrc = 45;
K = 0.03;
CL = 1.7;
Q = 700;
t = 0:0.05:2;
y0 = 0;
R = 0.02;

[tsol,ysol] = ode45(@(t,Palv) task2run(t,Palv), t, y0);
% [tsol,ysol] = ode45(@(t,y) Compliance(t,y,Cfrc,K,CL,SP,TOP,N,Palv),t,y0);
Palv = ysol;
Paw = task3fun(Q,R,Palv);
% paw = (R*Q) + Palv;


% result that compare Paw and Paw_correct 
load('Results_Task3.mat')
plot(paw_correct,Paw)
xlabel('time[s]');
ylabel('aveolar pressure]mbar]');
