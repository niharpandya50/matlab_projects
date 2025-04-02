 clc ;
 clear all;
 
 
 Tc = 0.09; % Time elapsed
 x = 0.02;
 y = 0;
 t = 0:5:60;
 % assumed value %  

 PRAD = 5; % Pressure of Right artrium distole value ( -2 to 8 mmHg) we took 5
 VRAD =  41;  % Volume of Right Atrium distole
 Vua = 52; % Volume of right atrium ( 24 - 82mL) we took 52
 PRAS = 3; % Pressure of Right artrium sysytole value ( <5) we took 3
 VRAS = 32; %Volume of Right atrium systole (24-81) we took 32


 % For Atrium 
aRAD = ( PRAD / (VRAD - Vua));
aRAS = ( PRAS / (VRAS - Vua));


PRVD = 4; % Pressure of right ventricle (3-7) we took 4
VRVD = 130; % Volume of Right Ventricle (100-160mL ) we took 130
Vud = 88; % volume of right ventricle ( 63-103) we took 88
PRVS = 25; % Pressure of right ventricle systole ( 20 -30 ) we took 25
VRVS = 66; % volume of right ventricle systole ( 20-80) we took 66

 % For Ventricle 
aRVD = ( PRVD / (VRVD - Vud));
aRVS = ( PRVS / (VRVS - Vud));


 aRA =  (x *(aRAS - aRAD) + aRAD);
 aRV = (y *(aRVS - aRVD) + aRVD);
  

 VRA = 50; % Volume of right atrium ( NO systole or dystole)
 VuRA = 61; %%%%%% USELESS 
 VRV =  94; % Volume of right ventricle ( NO systole or dystole)
 VuRv = 101; %%%%%%% USELESS


 % MAIN EQN %
 PRA = ( aRA *(VRA - VuRA ));
 PRV = ( aRV *( VRV - VuRv) );


% Plot Right Atrium vs Time
figure;
plot(t, PRA, 'b-', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Right Atrium PRA');
title('Half Sinus Right Atrium');


% Plot Right Ventricle vs Time
figure;
plot(t, PRV, 'b-', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Right Ventricle PRV');
title('Half Sinus Right Ventricle');






