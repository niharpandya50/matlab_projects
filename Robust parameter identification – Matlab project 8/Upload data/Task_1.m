clear
clc
close all

Data_Task1 = load ('Inputs_task1.mat');
t = Data_Task1.t;
Q = Data_Task1.flow;

R = 0.007;      
C = 55;         
R1 = 0.006;     
R2 = 0.004;     
C1 = 60;        
C2 = 20;        

FOM_Results = FOM(t,Q,R,C);
VEM_Results = VEM(t,Q,R1,R2,C1,C2);

subplot(1,2,1)
plot(t,FOM_Results,'linewidth',1.5)
ylim([0 max(max([FOM_Results VEM_Results]))])
xticks(min(t):0.5:max(t))
grid on
xlabel ('time [s]')
ylabel('airway pressure [mbar]')
title ('FOM');

subplot(1,2,2)
plot(t,VEM_Results,'linewidth',1.5)
ylim([0 max(max([FOM_Results VEM_Results]))])
xticks(min(t):0.5:max(t))
grid on
xlabel ('time [s]')
ylabel('airway pressure [mbar]')
title ('VEM');
