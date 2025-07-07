clear all;
close all;
clc;

data = xlsread('Extracted_data4_theta_45.xlsx');

Frequency = data(:, 1); %Frequency at Column1 at Excel Sheet
Rxx = data(:, 2);  %Rxx at Column2 at Excel Sheet
Ryx = data(:, 3);  %Ryx at Column2 at Excel Sheet

% Create a single figure with subplots
figure;

% Plot Frequency vs. Rxx and Ryx on the first subplot
subplot(5, 1, 1);
plot(Frequency, Rxx, 'LineWidth', 2);
hold on;
plot(Frequency, Ryx, 'LineWidth', 2);
hold off;
ylabel('Reflection Coefficients')
title('Frequency vs. Rxx and Ryx')
legend('Rxx', 'Ryx')
grid on

% Calculate the Polarization Conversion Ratio (PCR)
PCR = (Ryx.^2) ./ (Rxx.^2 + Ryx.^2);

% Calculate the Ellipticity Conversion Ratio (ECR)
ECR = (Rxx.^2 + Ryx.^2);

% Calculate Axial Ratio (AR)
R = Ryx ./ Rxx;
thetaxx = data(:, 4); %Theta_xx at Column4 at Excel Sheet
thetayx = data(:, 5); %Theta_yx at Column5 at Excel Sheet
del_theta = thetayx - thetaxx;
arg_schi = (2 * R .* sind(del_theta)) ./ (1 + R.^2);
schi = 0.5 * asin(arg_schi);
ar = abs(1 ./ tan(schi));
AR_dB = 20 * log10(ar);

% Calculate Normalized Ellipticity
S0 = abs(Ryx).^2 + abs(Rxx).^2;
S3 = 2 * abs(Ryx) .* abs(Rxx) .* sind(del_theta);
e = S3 ./ S0;

% Plot PCR on the second subplot
subplot(5, 1, 2);
plot(Frequency, PCR, 'LineWidth', 2);
ylabel('PCR')
title('Frequency vs. Polarization Conversion Ratio (PCR)')
grid on

% Plot ECR on the third subplot
subplot(5, 1, 3);
plot(Frequency, ECR, 'LineWidth', 2);
ylabel('ECR')
title('Frequency vs. Energy Conversion Ratio (ECR)')
grid on

% Plot AR on the fourth subplot
subplot(5, 1, 4);
plot(Frequency, AR_dB, 'LineWidth', 2);
ylabel('Axial Ratio (dB)')
title('Frequency vs. Axial Ratio (AR)')
grid on
ylim([0, 3]);

% Plot normalized ellipticity (e) on the fifth subplot
subplot(5, 1, 5);
plot(Frequency, e, 'LineWidth', 2);
xlabel('Frequency (Hz)')
ylabel('Normalized Ellipticity (e)')
title('Frequency vs. Normalized Ellipticity (e)')
grid on
ylim([-1, 1]); % Set y-axis limit from -1 to 1