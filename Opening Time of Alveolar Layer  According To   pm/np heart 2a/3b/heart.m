function [a_ra,a_rv]=heart(t)

Th=0.8; % Heart Period

 tas = 0.1 + (0.09*Th); % Duration of Arterial Systole
 tav = tas - 0.04; % Time between onset of arterial systole and the onset of Ventricular systole
 tvs = 0.16 + (0.2*Th); % Duration of Ventricular Systole

aRAS=0.3; % Maximum Value of Elastance Function of Right Atrium (Systole)
aRAD=0.046; % Minimum Value of Elastance Function of Right Atrium (Diastole)
aRVS=0.15; % Maximum Value of Elastance Function of Right Ventricle (Systole)
aRVD=0.05; %Minimum Value of Elastance Function of Right Ventricle (Diastole)

Tc=rem(t,Th); % Elapsed Time

for  i=1:length(t)
if(0<Tc(i) && Tc(i)<=tas) 
    x(i) = sin((3.14*Tc(i))/tas);
else
    x(i) = 0;
end

if(tav<Tc(i) && Tc(i)<(tav+tvs))
    y(i) = sin((3.14*(Tc(i)-tav))/tvs);
else
    y(i) = 0;
end
end

% Elastance Function for Two Heart Chambers
 a_ra = (x *(aRAS - aRAD) + aRAD); % For Right Atrium
 a_rv = (y *(aRVS - aRVD) + aRVD); % For Right Ventricle
