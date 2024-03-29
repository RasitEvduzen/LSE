% LSE Based Circle Fitting
% Written By: Rasit
% 3-May-2022
close all,clear all, clc;
%%
C = [3 , 5];  % Center
R = 2;        % Radius
NoD = 1e4;
tspan = linspace(0,2*pi,NoD);
noise = 5e-2*randn(1,NoD)-1;
Data = C + [ R*noise.*cos(tspan) ; R*noise.*sin(tspan) ]';

% Lse Solution
A = [Data(:,1) Data(:,2) ones(NoD,1)];   % Regressor Matrix
b = [Data(:,1).*Data(:,1) + Data(:,2).*Data(:,2)];
xlse = inv(A'*A)*A'*b;  % Lse Parameters

xc = xlse(1)/2; 
yc = xlse(2)/2; 
r = sqrt(4*xlse(3)+xlse(1)*xlse(1)+xlse(2)*xlse(2))/2;

% Plot Result
figure('units','normalized','outerposition',[0 0 1 1],'color','w')
plot (Data(:,1) , Data(:,2), 'b.');
axis tight equal,grid on,hold on;
Circle = [xc+r*cos([0:pi/50:2*pi]);yc+r*sin([0:pi/50:2*pi])]';
plot (Circle(:,1), Circle(:,2), 'r', 'LineWidth', 4);
legend ('Points', 'Least-square circle');
xlabel('X'),ylabel('Y')
xline(xc,'HandleVisibility','off'),yline(yc,'HandleVisibility','off')