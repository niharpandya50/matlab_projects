% finding the Alveolar pressure of the lung 
% H = variable to show unit is open or not

Palv = 0:0.1:35;  % Palv(mbar)= pressure inside the each alveolar
Cfrc = 45; % Cfrc(mL/mbar)= total lung compliance at the bigining of inspiration
K = 0.03;  % K(1/mbar) = describes how fast compliance decreases with increasing pressure  
CL = 1.7; % CL(mL/mbar)= fix compliance value for each alveolar 
TOP = 10; % TOP(mbar) = Threshold opening pressure
SP = 0:0.5:14.5; % SP(mbar) = superimposed pressure
N  = 30; % N = total number of lung unit 

% call for compliance function
C =zeros(1,length(Palv));
for i = 1:length(Palv)
C(i) = Compliance(Cfrc,K,CL,SP,TOP,N,Palv(i));
end

% finding volume from compliance

V = C.*Palv;

% plot for alveolar pressure vs volume

plot(Palv,V)

