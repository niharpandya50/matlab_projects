function [Csum2,voltot2f,time_Recr,P_alv] = sse3(OpMin,OpMax,OPConst,dt,PEEP,PIP,std)
Csum2 = [];
voltot2f = [];
time_Recr = [];
P_alv = PEEP:PIP;

Open_Range = OpMin:OpMax;
p = normcdf(Open_Range,mean(Open_Range),std);
plot(p,Open_Range)
time_open_tot = 0;

for i = 1:length(P_alv)
    Csum = 0;
    voltotf = 0;
    
    press = P_alv(i);
    
    j = 0;
    
for sp = -0.5:0.5:14.5  % Superimposed Pressure 
    j = j+1;
      
       k = 0;
       for opress = OpMin:OpMax
           k = k+1;
           P_threshold = opress;
           
           Open = 0;

           time_open = 0;

           
           
           if press > sp + opress
               vol =9000*0.0002*((P_alv(i)-sp))/(1+OpMax-OpMin);
               volf = vol*p(k);
               C = volf/(press-sp);
               

           else
                C = 0;

               
               volf = 0;

           end
               
           
           if(press-sp > P_threshold)

               while(Open < 1)
                    Open = Open + OPConst*(press-sp-P_threshold)*dt;
                    time_open = time_open + dt;
                 
               end
           else

               time_open = 0;
              
           end
       
                                            
           Csum = Csum + C;
          
           voltotf = voltotf +volf;
           time_open_tot = time_open + time_open_tot;

           
          
        

       end
     time_Recr(j,i) = time_open_tot;
end
Csum2(end+1) = Csum;

voltot2f(end+1) = voltotf;

end
end


