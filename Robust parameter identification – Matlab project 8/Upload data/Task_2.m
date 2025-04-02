clear
clc
close all

Data_Task2 = load ('Inputs_task2.mat');

Q = Data_Task2.flow;
Paw = Data_Task2.Paw;
t = Data_Task2.t;

RC = Task_2Fun(Q,Paw)

R = RC(1);
C = RC(2);

plot(t,Paw,'b','linewidth',1.5)
hold on
FOM_Results = FOM(t,Q,R,C);
plot(t,FOM_Results,'r--','linewidth',1.5)
ylim([0 20])
grid on
xlabel ('time [s]')
ylabel('airway pressure [mbar]')
title ('Linear Regression of FOM');
legend({'Measured data','Fitted FOM'},'location','southeast');
