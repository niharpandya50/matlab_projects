function Params = Task_3Fun(t,Q,Paw,tau)
RC = Task_2Fun(Q,Paw);

R=RC(1);
C=RC(2);

R1=0.5*R;
R2=R-R1;

C2=(tau)./R2;
C1=((C.^-1)-(C2.^-1)).^-1;

initial_guess=[R1 R2 C1 C2];

opt=optimset('MaxFunEvals',10000,'TolFun',1e-6);
x=fminsearch(@(x) Objective_Fun(x,t,Q,Paw),initial_guess,opt);

Params = x;

R1x=x(1);
R2x=x(2);
C1x=x(3);
C2x=x(4);

end