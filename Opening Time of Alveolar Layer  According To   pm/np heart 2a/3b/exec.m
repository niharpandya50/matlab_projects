t=0:0.01:2;
[a_ra,a_rv]=heart(t);

Vra=153.63; % Volume of Right Artium
Vrv=132.32; % Volume of Right Ventricle
Vu_ra=30; % Unstressed Volume of Right Atrium
Vu_rv=0; % Unstressed Volume of Right Ventricle

Pra=a_ra*(Vra-Vu_ra); % Pressure of Right Atrium
Prv=a_rv*(Vrv-Vu_rv); % Pressure of Right Ventricle

figure(1);
plot(t,Pra);
xlabel('Time (s)');
ylabel('Right Atrium Pra');
title('Half Sinus Right Atrium');

figure(2);
plot(t,Prv);
xlabel('Time (s)');
ylabel('Right Ventricle Prv');
title('Half Sinus Right Ventricle');