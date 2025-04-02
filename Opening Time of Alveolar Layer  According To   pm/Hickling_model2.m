function [timeo,volume,Cfinal] = Hickling_model2(P_alv,OpMin,OpMax,Const_O)
volume = [];
A =0.01;
B = 0.01;
K = 0.03;
Cfinal =[];
k = 0;
dt = 0.001;
for i = 1:length(P_alv) %alveolar pressure found by ode45
    press = P_alv(i);
    k = k + 1;
    voltot=0;
    C2 = 0;
    j = 0;
    for sp = -0.5:0.5:14.5
        j = j+1;
        to = 0;
        for opressure = OpMin:OpMax
            if OpMin == OpMax || OpMax == 0
                opressure = OpMax;
            end
            open = 0;-
            
            if  press >(sp + opressure)
                vol = (9000*(A-B*exp(-K*(press-sp)))/(1+OpMax-OpMin));
                C = vol/(press-sp);
                if open < 1
                    open =  open + Const_O* (press - (sp + opressure))*dt;
                    while open < 1
                        dt = 0.001;
                        open =  open + Const_O* (press - (sp + opressure))*dt;
                        to = to + dt;
                    end
                end
                
            else
                vol = 0;
                C = 0;
                to= 0;
            end
            
            voltot= voltot + vol;
            C2 = C2 + C;
        end
        timeo(j,i) = to;
        
    end
    voltot2 = voltot;
    volume(end+1)= voltot2;
    Cfinal(end+1) = C2;
end
end



