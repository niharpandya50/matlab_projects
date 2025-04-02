function [voltot2] = DEFLATION(y,State,OpMin,OpMax)

Lung_Level_Units = 9000;

A = 0.0072;     % Change A to 0.01 for Given Salazar/Knowles (Question 2)
B = 0.0072;     % Change B to 0.01 for Given Salazar/Knowles (Question 2)
K = 0.078;      % Change K to 0.15 for Given Salazar/Knowles (Question 2)

voltot2 = [];
PIP = max(y);
PEEP = min(y);
    
for i = 1:length(y)
    press = y(i);
   
   voltot = 0;
   
   if State == 1
       Transient = PEEP;
   else
       Transient = press;
   end
   
   for sp = -0.5:0.5:14.5   % Superimposed Pressure
       % 30 Lung Levels each with 9000 units
       for opress = OpMin:OpMax
           
           if OpMin == 0 || OpMin == OpMax
               opress = OpMax;
           end
           
           if press > (sp + opress)
               
               volm = A-B*exp(-K*(press-sp));
               vol = volm*Lung_Level_Units/(1+OpMax-OpMin);
               
           elseif PIP > (sp + opress) && Transient > sp

               volm = A-B*exp(-K*(press-sp));
               vol = volm*Lung_Level_Units/(1+OpMax-OpMin);
           else
               
               vol = 0;
           end
                                           
           voltot = voltot + vol; 
           
       end
   end
   
   voltot2(end+1) = voltot;        % Leaves voltot as counter
  
end

end
