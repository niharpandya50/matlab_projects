function RC = Task_2Fun(Q,Paw)

IntFlow =[];
v(1) =0;

for i=2:length(Q)
    v(i)=v(i-1)+0.01*Q(i);
    IntFlow(end+1)= v(i);
end

V = v';

A=[Q V];

res = A\Paw;

R=res(1,:);
C=1./res(2,:);

RC=[R C];

end