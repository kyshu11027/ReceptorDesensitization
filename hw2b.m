clc; clear; close all;
initialTime = 0;
finalTime = 1/60;

tspan = [initialTime finalTime];

%initial conditions
%index 1 is L, 2 is R, 3 is LR, 4 is LD, 5 is D
conc0 = [11; 11; 0; 0; 11];%concentration of each molecule
k = [600; 6000; 28.8; 0.288; 600; 60; 0.06; 0.06]; %rate constants in one matrix

tolerance = 1e-5;
options = odeset('RelTol', tolerance, 'AbsTol', tolerance);
[t, conc] = ode45(@DE1, tspan, conc0, options, k);

%all the plotting into subplots
figure(1);
subplot(2, 2, 1);
plot(t, conc(:,2));
title('Receptor Concentration (然) vs. Time (min)');
ylabel('Receptor Concentration (然)');
xlabel('Time (min)');

subplot(2,2,2);
plot(t, conc(:, 3));
title('Bound Ligand and Receptor Concentration (然)vs. Time(min)');
ylabel('Bound Ligand and Receptor Concentration (然)');
xlabel('Time (min)');

subplot(2,2,3);
plot(t, conc(:, 4));
title('Bound Ligand and Desensitized Receptor Concentration (然)vs. Time(min)');
ylabel('Bound Ligand and Desensitized Receptor Concentration (然)');
xlabel('Time (min)');

subplot(2,2,4);
plot(t, conc(:, 5));
title('Desensitized Receptor Concentration (然)vs. Time(min)');
ylabel('Desensitized Receptor Concentration (然)');
xlabel('Time (min)');