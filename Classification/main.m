clc,clear all, close;
% LSE Based Binary Classification
% Written By: Rasit
% 07-Jul-2024
%% Create Data
NoD = 100; % Number of Data
X = [randn(NoD,2)+1.5; -randn(NoD,2)-1.5];  % Class Data
Y = [ones(NoD,1); -ones(NoD,1)];           % Class Label
A = [X ones(2*NoD,1)];
xlse = A\Y;


% Plot Result
[i, j] = meshgrid(min(X(:,1)):1e-1:max(X(:,1)), min(X(:,2)):1e-1:max(X(:,2)));
decision_boundary = xlse(1) * i + xlse(3) + j * xlse(2);

figure('units','normalized','outerposition',[0 0 1 1],'color','w'),hold on
contourf(i, j, sign(decision_boundary), 'LineColor', 'none');

scatter(X(Y == 1, 1), X(Y == 1, 2), 'k',"filled")
scatter(X(Y == -1, 1), X(Y == -1, 2), 'g',"filled");
x_line = linspace(min(X(:,1)), max(X(:,1)), 100);
y_line = -(xlse(1) * x_line + xlse(3)) / xlse(2);
plot(x_line, y_line, 'r',LineWidth=4);
xlabel('X1'),ylabel('X2'),title('LSE Based Binary Classification');


 
