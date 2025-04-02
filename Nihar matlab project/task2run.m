% function for task 2

% finding the Alveolar pressure using non-linear compliance from task 1

function dpalv = task2run(tinsp,Palv,Cfrc,K,CL,TOP,SP,N)


% non-linear compliance
C1 =zeros(1,length(Palv));
for i = 1:length(Palv)
C1(i) = Compliance(Cfrc,K,CL,SP,TOP,N,Palv(i));
end

% ODE equation 
Q =700;
dpalv = Q/C1;

end