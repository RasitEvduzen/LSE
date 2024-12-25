clc,clear all,close all;
% Written By: Rasit
% 20-Mar-2022
%% RBF Function Fit via LSE

x = (-5:1e-1:5)';
a1 = radbas(x-2);
a2 = radbas(x);
a3 = radbas(x+2);
rand_bias = 0.5*rand;
final = 2*a1 + 3*a2 + 4*a3 + rand_bias;  % Synthetic Data

% Find parameter via Least Squers
b = final;
A = [a1 a2 a3 ones(size(x,1),1)];   % Regressor Matrix
xhat = inv(A'*A)*A'*b;              % Parameters
fitted_func = xhat(1)*a1 + xhat(2)*a2 + xhat(3)*a3 + xhat(4); 


figure('units','normalized','outerposition',[0 0 1 1],'color','w')
% Plot data
plot(x,final,"ko",LineWidth=2),hold on,grid on
plot(x,fitted_func,"r",LineWidth=2)
plot(x,a1,'b--')
plot(x,a2,'b--')
plot(x,a3,'b--')
legend("Original Data","Fitted Function","Basis Function","Basis Function","Basis Function")


























