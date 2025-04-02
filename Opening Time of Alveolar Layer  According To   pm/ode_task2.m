
function dpalv = ode_task2(t,P_alv,flag,OpMin,OpMax)
Cfinal = [];


for i = 1:length(P_alv)
    [Cfinal,~] = complince_volume2(P_alv(i),OpMin,OpMax);
end
flow  = 500;

 dpalv=(1/Cfinal)*flow;

end