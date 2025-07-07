data = xlsread('r_uv.xlsx');
Frequency = data(:, 1); %Frequency at Column1 at Excel Sheet
Ruu = data(:, 2);  %Rxx at Column2 at Excel Sheet
Rvv = data(:, 3);  %Rxx at Column3 at Excel Sheet

Ruv = data(:, 4);  %Ryx at Column4 at Excel Sheet
Rvu = data(:, 5);  %Ryx at Column5 at Excel Sheet
data2 = xlsread('phiuuvv.xlsx');
thetauu = data2(:, 1); %Theta_uu at Column6 at Excel Sheet
thetavv = data2(:, 2); %Theta_vv at Column7 at Excel Sheet
del_theta = thetauu - thetavv;

figure(1)
plot(Frequency, Ruu, 'LineWidth', 2);
hold on;
plot(Frequency, Rvv, 'LineWidth', 2);
hold on;
plot(Frequency, Ruv, 'LineWidth', 2);
hold on;
plot(Frequency, Rvu, 'LineWidth', 2);
hold off;
xlim([5,35]);
ylabel('Reflection Coefficients')
yline( 0.9,'--' , 'Color', 'k', 'Linewidth', 1.5)
title('Frequency vs. Ruu, Rvv, Ruv and Rvu')
legend('Ruu', 'Rvv' ,'Ruv', 'Rvu' )

figure(2)
plot(Frequency, thetauu, 'LineWidth', 2);
hold on;
plot(Frequency, thetavv, 'LineWidth', 2);
hold on;
plot(Frequency, del_theta,'--', 'LineWidth', 2);
hold off;
xlim([5,35])
yline( 180,'--' , 'Color', 'k', 'Linewidth', 1.5);
yline( -180,'--' , 'Color', 'k', 'Linewidth', 1.5)
title('Frequency vs. theta-uu, theta-vv and del-theta')
legend('Theta(uu)', 'Theta(vv)' ,'del-theta')
