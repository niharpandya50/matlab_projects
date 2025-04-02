function [Csum2,voltot2,time_Recr] = Compliance_RB(P_alv,OpMin,OpMax,OPConst,dt)

% Delta_Input_Time = 0.01;
% 
% A = 0.0072;     
% B = 0.0072;     
% K = 0.078;      

Csum2 = [];
voltot2 = [];
time_Recr = [];
% time_DeRecr = [];
% Opnemat = [];
% voltot3 = [];    
% voltot4 = []; 

% Lung_Level_Units = 9000;

for i = 1:length(P_alv)
    Csum = 0;
    voltot = 0;
%     voltot3_in = 0;
%     voltot4_in = 0;
    time_open_tot = 0;
%     time_elapsed_tot_d = 0;
    press = P_alv(i);
    
    j = 0;
    
for sp = -0.5:0.5:14.5  % Superimposed Pressure 
    j = j+1;
       % 30 Layers
       for opress = OpMin:OpMax
           
%            if OpMin == 0 || OpMin == OpMax
%                opress = OpMax;
%            end
           
           P_threshold = opress;
           
           Open = 0;
%            Opend = 1;
           time_open = 0;
%            time_elapsed_d = 0;
%            vol = 0;
           
           
           if press > sp + opress
               vol =9000*0.0002*((P_alv(i)-sp))/(1+OpMax-OpMin);
               C = vol/(press-sp);
               
%                volm_2 = A-B*exp(-K*(press-sp));
%                Vol_2 = 0;
               
%                volm_3 = A-B*exp(-K*(press-sp));
%                Vol_3 = volm_3*Lung_Level_Units/(1+OpMax-OpMin);
           else
                C = 0;
               vol = 0;
               
               
%                Vol_2 = 0;
%                
%                Vol_3 = 0;
           end
               
           
           if(press-sp > P_threshold)

               while(Open < 1)
                    Open = Open + OPConst*(press-sp-P_threshold)*dt;
                    time_open = time_open + dt;
%                     Opnemat(end+1) = Open; 
               end
%                time_elapsed_d = 0;
               
%            elseif (press-sp < P_threshold)
               
%                while(Opend > 0)
%                     Opend = Opend + OPConstDR*(press-sp-P_threshold)*dt;
%                     time_elapsed_d = time_elapsed_d + dt;
%                end
%                time_elapsed = 0;
           else

               time_open = 0;
%                time_elapsed_d = 0;
           end
           
%            if time_elapsed < Delta_Input_Time
%                if press > sp + opress
%                volm_2 = A-B*exp(-K*(press-sp));
%                Vol_2 = volm_2*Lung_Level_Units/(1+OpMax-OpMin);
%                end
%            else
%                Vol_2 = 0;
%            end
           
%             if time_elapsed_d < Delta_Input_Time
%                if press > sp + opress
%                volm_3 = A-B*exp(-K*(press-sp));
%                Vol_3 = volm_3*Lung_Level_Units/(1+OpMax-OpMin);
%                end
%            else
%                Vol_3 = 0;
%            end
                                            
           Csum = Csum + C;
           voltot = voltot + vol;
           time_open_tot = time_open + time_open_tot;
%            time_elapsed_tot_d = time_elapsed_tot_d + time_elapsed_d;
%            voltot3_in = Vol_2 + voltot3_in;
%            voltot4_in = Vol_3 + voltot4_in;
           
           time_Recr(j,i) = time_open_tot;
%            time_DeRecr(j,i) = time_elapsed_tot_d;

       end
    
end
Csum2(end+1) = Csum;
voltot2(end+1) = voltot;
% voltot3(end+1) = voltot3_in;
% voltot4(end+1) = voltot4_in;
end
end


