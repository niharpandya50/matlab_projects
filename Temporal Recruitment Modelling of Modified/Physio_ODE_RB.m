function dy = Physio_ODE_RB(t,y,flag,Vdot,duration,OpMin,OpMax,OPConst,Delta_t,OPConstDR)

    dy = zeros(length(y),1);    % pre allocation of the vector

    [Comp,voltot2,time_Recr,time_DeRecr,Opnemat] = Compliance_RB(y,OpMin,OpMax,OPConst,Delta_t,OPConstDR);

    if t>duration
        dy = 0;
    else
        if Comp == 0
            dy = 0;
        else
            dy = Vdot*(1/Comp);
        end
    end
end

