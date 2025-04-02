Paw = 0:35;
R = 0.05;
C = 50;
P0 = 0;

t = zeros(length(Paw),1);
v = zeros(length(Paw),1);
vdot = zeros(length(Paw),1);
t(1) = 0;
v(1) = 0;
vdot(1) = 0;
tStep = 0.15;

for i = 1:length(Paw)-1
   t(i+1) = t(i)+tStep; 
   vdot(i+1) = (Paw(i)-(v(i)./C)-P0)./R;
   v(i+1) = v(i)+(tStep.*(vdot(i+1)));
end
Vol1 = v;
Paw1 = Paw;
t1 = t;
vdot1 = vdot;
% for i = 1:length(Paw)-1
%    t(i+1) = t(i)+1; 
%    v(i+1) = v(ri)+(1.*((Paw(i)-(v(i)./C)-P0)./R));
% end
figure
plot(t,vdot)
title("Flow over time")
xlabel("Time [sec]")
ylabel("Flow V' [ml/sec]")

figure
plot(t,Paw)
title("Pressure over Time")
xlabel("Time [sec]")
ylabel("Pressure P [mbar]")

figure
plot(Paw,v)
title("Volume over Pressure")
xlabel("Pressure P [mbar]")
ylabel("Volume V [ml]")



%## Expiration phase
t_start = t(end);
v_start = v(end);
Paw = 0:35;
Paw = flip(Paw);
t = zeros(length(Paw),1);
v = zeros(length(Paw),1);
vdot = zeros(length(Paw),1);

t(1) = t_start;
v(1) = v_start;
vdot(1) = 0;
tStep = 0.15;

for i = 1:length(Paw)-1
   t(i+1) = t(i)+tStep; 
   vdot(i+1) = (Paw(i)-(v(i)./C)-P0)./R;
   v(i+1) = v(i)-(tStep.*(vdot(i+1)));
end

Vol2 = v;
Paw2 = Paw;
t2 = t;
vdot2 = vdot;

figure
plot(t,vdot)
title("Flow over time")
xlabel("Time [sec]")
ylabel("Flow V' [ml/sec]")

figure
plot(t,Paw)
title("Pressure over Time")
xlabel("Time [sec]")
ylabel("Pressure P [mbar]")

figure
plot(Paw,v)
title("Volume over Pressure")
xlabel("Pressure P [mbar]")
ylabel("Volume V [ml]")

figure
hold on
plot(Paw1,Vol1, 'k')
plot(Paw2, Vol2, 'r')
title("Volume over Pressure")
xlabel("Pressure P [mbar]")
ylabel("Volume V [ml]")
hold off

figure
hold on
plot(t1,Paw1,'k')
plot(t2, Paw2, 'r')
title("Volume over Pressure")
xlabel("Pressure P [mbar]")
ylabel("Volume V [ml]")
hold off

figure
hold on
plot(t1, vdot1, 'k')
plot(t2, vdot2, 'r')
title("Volume over Pressure")
xlabel("Pressure P [mbar]")
ylabel("Volume V [ml]")
hold off