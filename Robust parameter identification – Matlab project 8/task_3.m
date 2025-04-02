clear
clc
close all

Data_Task3 = load ('Inputs_task3.mat');
t = Data_Task3.t;
Q = Data_Task3.flow;
Paw = Data_Task3.Paw;
Tau = Data_Task3.tau;

Params = Task_3Fun(t,Q,Paw,Tau)

R1 = Params(1);
R2 = Params(2);
C1 = Params(3);
C2 = Params(4);

PawFitted = VEM(t,Q,R1,R2,C1,C2);

plot(t,Paw,'b','linewidth',1.5)
xlim([0 max(t)]);
ylim([0 max(Paw)]);

hold on
plot(t,PawFitted,'r--','linewidth',1.5)
grid on
xlabel ('time [s]')
ylabel('airway pressure [mbar]')
title ('Hierarchical Identification of VEM');
legend({'Measured data','Fitted VEM'},'location','southeast');

