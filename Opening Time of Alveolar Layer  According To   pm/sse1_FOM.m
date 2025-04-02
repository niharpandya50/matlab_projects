function [Csum2,voltot2]=sse1_FOM(p_a)
voltot2=[];
Csum2=[];
opmin=0;
opmax=4;

for i=1:length(p_a)
    Csum=0;
    voltot=0;
    for sp=-0.5:0.5:14.5
        for opress=opmin:opmax %j=opress
%             opress=0;
            h=sp+opress; %h=sp+opress
            if p_a(i)>h
                vol=9000*0.0002*((p_a(i)-sp))/(1+opmax-opmin);
                p=1/(p_a(i)+sp);
                C=vol*p;

            elseif p_a(end) >h && p_a(1) >sp
                vol=9000*0.0002*((p_a(i)-sp))/(1+opmax-opmin);
                p=1/(p_a(i)+sp);
                C=vol*p;

            else
                vol=0;
                p=0;
                C=0;

            end
         
            Csum=Csum+C;
            voltot=voltot+vol;
            
        end
    end
    Csum2(end+1)=Csum;
    voltot2(end+1) = voltot;
end
