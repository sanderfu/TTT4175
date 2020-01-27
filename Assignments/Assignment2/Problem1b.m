%% Importing data
t = importdata("t.txt");
x = transpose(importdata("x.txt")); %Transpose to get on the standard vector form (column)
N = size(t,2);

%Plotting the imported data for comparison
figure(1);
clf; %Clear all figures
grid on;
hold on;
plot(t,x,'LineWidth', 1.5);

%% Defining the linear model
%theta = [A,B,C];
%Form: x = H*theta+w
H_A(1:N) = (1);
H_B(1:N) = (0);
for i =1:N
    H_B(i) = t(i);
end
H_C(1:N) = (0);
for i = 1:N
    H_C(i) = sin(2*pi*t(i));
end
H = transpose([H_A; H_B; H_C]);

%Noise:
 variance = 1;
 mean = 0;
 
 %%Calculation MVU estimator
 theta_est = inv(((transpose(H)*H)))*transpose(H)*x;
 crlb_est  = variance*inv(transpose(H)*H);
 
 %% Calculation estimated data and comparing to raw
 x_est(1:N) = (0);
 for i = 1:N
     x_est(i) = theta_est(1)+theta_est(2)*t(i)+theta_est(3)*sin(2*pi*t(i));
 end
 plot(t,x_est, 'LineWidth', 1.5);
 title("Comparision between raw data and estimate");
 xlabel("t[s]");
 ylabel("x(t)");
 legend("Raw data", "Estimate");
 
 %Saving the figure
 saveas(1,"comparison.png");
