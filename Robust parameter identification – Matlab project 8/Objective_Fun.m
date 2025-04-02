function SSE = Objective_Fun(x,t,Q,Paw_Measured)

R1=x(1);
R2=x(2);
C1=x(3);
C2=x(4);

Paw_Simulated = VEM(t,Q,R1,R2,C1,C2);

SSE = sum((Paw_Simulated-Paw_Measured).^2);

end

