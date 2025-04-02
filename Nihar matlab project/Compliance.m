% compliance equation given in project file


% TOP(mbar)     = Threshold opening pressure
% SP(mbar)      = superimposed pressure
% H             = variable to show unit is open or not
% N             = total number of lung unit 
% Cfrc(mL/mbar) = total lung compliance at the bigining of inspiration
% Palv(mbar)    = pressure inside the each alveolar 
% CL(mL/mbar)   = fix compliance value for each alveolar 
% K(1/mbar)     = describes how fast compliance decreases with increasing pressure 

function  C = Compliance(Cfrc,K,CL,SP,TOP,N,Palv)
X1  =[];

for  i = 1:N     
    if Palv < (SP(i) + TOP)
    H = 0; 
    X = H * exp(-K*(Palv - (TOP +SP(i))));
    
   elseif Palv >= (SP(i) + TOP)      
   H = 1;
   X = H * exp(-K*(Palv - (TOP +SP(i))));
    end


 X1(end+1) = X;
end

X2 = sum(X1);
C = Cfrc* exp(-K*Palv) + CL * X2;
end


