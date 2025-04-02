% Cardiovascular System Model

% Parameters (Assumed values)
Vlv = 150;        % Left ventricle volume (mL)
Vrv = 150;        % Right ventricle volume (mL)
Vla = 100;        % Left atrium volume (mL)
Vra = 100;        % Right atrium volume (mL)
Vsc = 5000;       % Systemic circulation volume (mL)
Vpc = 500;        % Pulmonary circulation volume (mL)

Rsys = 17.5;      % Systemic resistance (mmHg/mL/s)
Rpc = 2.5;        % Pulmonary resistance (mmHg/mL/s)

Clv = 0.8;        % Left ventricle compliance (mL/mmHg)
Crv = 0.8;        % Right ventricle compliance (mL/mmHg)
Cla = 0.4;        % Left atrium compliance (mL/mmHg)
Cra = 0.4;        % Right atrium compliance (mL/mmHg)
Csc = 0.05;       % Systemic compliance (mL/mmHg)
Cpc = 0.2;        % Pulmonary compliance (mL/mmHg)

% Initial conditions
Plv0 = 120;       % Left ventricle pressure (mmHg)
Prv0 = 20;        % Right ventricle pressure (mmHg)
Pla0 = 8;         % Left atrium pressure (mmHg)
Pra0 = 3;         % Right atrium pressure (mmHg)
Psc0 = 80;        % Systemic circulation pressure (mmHg)
Ppc0 = 10;        % Pulmonary circulation pressure (mmHg)

% Time span
tspan = [0 10];   % Simulation time span (seconds)

% Solve the differential equations
[t, y] = ode45(@cvSystemModel, tspan, [Plv0 Prv0 Pla0 Pra0 Psc0 Ppc0]);

% Extract variables from the solution
Plv = y(:, 1);
Prv = y(:, 2);
Pla = y(:, 3);
Pra = y(:, 4);
Psc = y(:, 5);
Ppc = y(:, 6);

% Plotting the results
figure;
subplot(3, 1, 1);
plot(t, Plv, 'r', 'LineWidth', 2);
hold on;
plot(t, Prv, 'b', 'LineWidth', 2);
legend('Left Ventricle Pressure', 'Right Ventricle Pressure');
xlabel('Time (s)');
ylabel('Pressure (mmHg)');
title('Ventricular Pressure');

subplot(3, 1, 2);
plot(t, Pla, 'r', 'LineWidth', 2);
hold on;
plot(t, Pra, 'b', 'LineWidth', 2);
legend('Left Atrium Pressure', 'Right Atrium Pressure');
xlabel('Time (s)');
ylabel('Pressure (mmHg)');
title('Atrial Pressure');

subplot(3, 1, 3);
plot(t, Psc, 'r', 'LineWidth', 2);
hold on;
plot(t, Ppc, 'b', 'LineWidth', 2);
legend('Systemic Circulation Pressure', 'Pulmonary Circulation Pressure');
xlabel('Time (s)');
ylabel('Pressure (mmHg)');
title('Circulation Pressure');

% Cardiovascular system model equations
function dydt = cvSystemModel(t, y)
    Plv = y(1);
    Prv = y(2);
    Pla = y(3);
    Pra = y(4);
    Psc = y(5);
    Ppc = y(6);

    % Left ventricle
    dPlvdt = (1 / Clv) * (Vlv - Clv * Plv - Crv * (Plv - Prv));

    % Right ventricle
    dPrvdt = (1 / Crv) * (Vrv - Crv * (Prv - Plv));

    % Left atrium
    dPladt = (1 / Cla) * (Vla - Cla * Pla - Cra * (Pla - Pra));

    % Right atrium
    dPradt = (1 / Cra) * (Vra - Cra * (Pra - Pla));

    % Systemic circulation
    dPscdt = (1 / Csc) * (Vsc - Csc * Psc - Rsys * (Psc - Ppc));

    % Pulmonary circulation
    dPpcdt = (1 / Cpc) * (Vpc - Cpc * Ppc - Rpc * (Ppc - Psc));

    dydt = [dPlvdt; dPrvdt; dPladt; dPradt; dPscdt; dPpcdt];
end