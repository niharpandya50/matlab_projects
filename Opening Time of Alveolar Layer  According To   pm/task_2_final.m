clear 
clc
OpMin = 0;
OpMax = 0;
Const_O = 0.5;
figure
PEEP = [0 5 10 15 20 25]; % different PEEP level
for i = 1:length(PEEP)    
param = PEEP(i);
tinsp = 0:0.01:1;
[tinsp,Palv] =ode45(@(tinsp,P_alv) ode_task2(tinsp,P_alv,'',OpMin,OpMax),tinsp,PEEP(i));
Palv = round(Palv);
 [timeo,volume,Cfinal] = Hickling_model2(Palv,OpMin,OpMax,Const_O);
% PV curve with diffrent PEEP

plot(Palv,volume,'LineWidth',2)
xlabel('alveolar pressure')
ylabel('volume')
[t,s] = title('P/V curve','Color','r');
t.FontSize = 16;
lgd(i) = ('PEEP' + string(PEEP(i)));
legend(lgd,'Location','southeast')
hold on 
end
% time grapf for opening layer 
PEEP = 0;
tinsp = 0:0.01:2;
[tinsp,Palv] =ode45(@(tinsp,P_alv) ode_task2(tinsp,P_alv,'',OpMin,OpMax),tinsp,PEEP);
Palv = round(Palv);
 [timeo,volume,Cfinal] = Hickling_model2(Palv,OpMin,OpMax,Const_O);
 
figure
for x = 1:length(0:0.5:14.5)
    plot(Palv,timeo(x,:))
    hold on
end

xlabel('Palv')
ylabel('open time')
[t,s] = title('opening time','Color','r');
t.FontSize = 16;
s.FontAngle = 'italic';


