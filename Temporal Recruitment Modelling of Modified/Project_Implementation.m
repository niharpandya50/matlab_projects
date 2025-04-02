PEEP = [0 5 10 15];         % Peak End Expiratory Pressure
OpMin = 0;                  % Minimum Threshold Opening Pressure
OpMax = 0;                  % Maximum Threshold Opening Pressure
Delta_t = 0.0001;           % Time step for Open calculations
Opconst = 25;               % Opening Constant
OPConstDR = 50;             % Closing Constant

Vdot = 500;                 % Volumetric Flow Rate
duration = 2;               % Duration of Volumetric Flow in seconds
yt = [];
tc = [];

for j = 1:length(PEEP)
    
    % Solving for time dependent pressure
    [t,y] = ode45('Physio_ODE_RB',0:0.01:4,PEEP(j),'',Vdot,duration,OpMin,OpMax,Opconst,Delta_t,OPConstDR);
    
    % Rounding the pressure to make the Open Variables Smooth
    y2 = round(y);

    a = table(y,y2);    % to see the p_aw values vs. p_aw rounded values
    
    % solving to find the volume and time of Open and Close
    [Csum2,voltot2,time_elapsed_tot2,time_DeRecr,Opnemat,voltot3,voltot4] = Compliance_RB(y2,OpMin,OpMax,Opconst,Delta_t,OPConstDR);
    
    % Plotting the times needed for Openoing on all layers
    subplot(2,3,1)
    for i = 1:length(-0.5:0.5:14.5)
    
        plot(y,time_elapsed_tot2(i,:),'-o')
        hold on

    end
    
    title('Airway Pressure vs. Open Time all layers [ode]')
    xlabel('Pressure [cmH2o]')
    ylabel('Time [s]')


    subplot(2,3,2)
    plot(y2,voltot2,'b')
    hold on
    plot(y2,voltot3,'r')
    title('P vs. V all layers [ode]')
    xlabel('Pressure [cmH2o]')
    ylabel('Volume [ml]')
    legend('Modified Hickling','mod. Hickl. with Recruitment','location','northwest')

    % Plotting the times needed for Closing on all layers
    subplot(2,3,4)
    for i = 1:length(-0.5:0.5:14.5)
    
        plot(y,time_DeRecr(i,:),'-o')
        hold on

    end
    
    title('P_alv vs. Open Time all layers [ode]')
    xlabel('P_alv')
    ylabel('Time')

    subplot(2,3,5)
    plot(y2,voltot2,'b')
    hold on
    plot(y2,voltot4,'--r')
    title('P vs. V all layers [ode]')
    xlabel('Pressure [cmH2o]')
    ylabel('Volume [ml]')
    legend('Modified Hickling','mod. Hickl. with DeRecruitment','location','northwest')
    
    % Calculating the volume values for Deflation
    vol = DEFLATION(y2,1,OpMin,OpMax);
    vold = DEFLATION(y2,2,OpMin,OpMax);

    subplot(2,3,3)
    plot(y2,vol,'b')
    hold on
    plot(y2,vold,'--r')
    xlabel('Pressure [cmH2o]')
    ylabel('Volume [ml]')
    legend('Inflation','Deflation','location','northwest')
    title('Complete Breathing Cycle of Lung w/ Re & DeRe')

    subplot(2,3,6)
    plot(y,time_elapsed_tot2(30,:),'b-o')
    % plot(y,time_DeRecr(30,:),'b-o')       % Uncomment to plot the
    % Derecruitement time of the last layer
    hold on
    title('Pressure vs. Open Time at layer 30, Recruitment')
    % title('Pressure vs. Open Time at layer 30, DeRecruitment')
    xlabel('Pressure [cmH2o]')
    ylabel('Time [s]')

end
%%
figure
Open_Range = 0:0.001:1;

p = normcdf(Open_Range,mean(Open_Range),std(Open_Range));

plot(Open_Range,p*100)
title('Gaussian Cummilative Distribution for Open Variable')
ylabel('Percentage %')
xlabel('Open Range')





