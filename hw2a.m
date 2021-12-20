clc; clear; close all;
initialTime = 0.0; 
finalTime = 1/60; % 1 second
h = 0.00001;
tRange = initialTime:h:finalTime;
n = length(tRange);

%initial conditions
%index 1 is L, 2 is R, 3 is LR, 4 is LD, 5 is D
conc(1,:) = [11 11 0 0 11];%concentration of each molecule
k = [600 6000 28.8 0.288 600 60 0.06 0.06]; %rate constants in one matrix

%actually implementing the RK2 method.
for i = 1:n-1
    rk1 = h*DE1(tRange(i), conc(i, :), k)';
    rk2 = h*DE1(tRange(i)+h/2, conc(i,:)+rk1/2, k)';
    conc(i+1, :) = conc(i, :)+rk1;
end

%plotting into subplots
figure(1);
subplot(2, 2, 1);
plot(tRange, conc(:,2));
title('Receptor Concentration (然) vs. Time (min)');
ylabel('Receptor Concentration (然)');
xlabel('Time (min)');

subplot(2,2,2);
plot(tRange, conc(:, 3));
title('Bound Ligand and Receptor Concentration (然)vs. Time(min)');
ylabel('Bound Ligand and Receptor Concentration (然)');
xlabel('Time (min)');

subplot(2,2,3);
plot(tRange, conc(:, 4));
title('Bound Ligand and Desensitized Receptor Concentration (然)vs. Time(min)');
ylabel('Bound Ligand and Desensitized Receptor Concentration (然)');
xlabel('Time (min)');

subplot(2,2,4);
plot(tRange, conc(:, 5));
title('Desensitized Receptor Concentration (然)vs. Time(min)');
ylabel('Desensitized Receptor Concentration (然)');
xlabel('Time (min)');
