
%calling for task 2 to find alveolar pressure 

tinsp =0:0.05:2.3;
Cfrc = 45;
K = 0.01;
CL = 1.8;
TOP = 10;
SP = 0:0.5:14.5;
N  = 30;

[tinsp,Palv] = ode45(@(tinsp,Palv) task2run(tinsp,Palv,Cfrc,K,CL,TOP,SP,N),tinsp,0);
figure
plot(tinsp,Palv)

