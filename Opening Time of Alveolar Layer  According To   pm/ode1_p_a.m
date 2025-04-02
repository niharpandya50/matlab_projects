function dp_a=ode1_p_a(t,p_a)

 [Csum2,voltot2]=sse1_FOM(p_a);
if Csum2==0
    dp_a=0;
else 
    dp_a=(1/Csum2)*500;
end  %flow=500
end
