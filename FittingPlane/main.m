clc,clear,close all;
% Plane Fitting via Least Squares 
% Written By: Rasit
% 29-Mar-2024
%% Create Data
NoD = 5e1;
xslope = 7;
yslope = 9;
zoffset = 5;
noise = 2*rand(NoD,1);
x = rand(NoD,1);
y = rand(NoD,1);
z = (xslope*x) + (yslope*y) + (zoffset) + (noise);


% Lse Fitting
A = [x y ones(NoD,1)];
b = z;
xlse = inv(A'*A)*A'*b;
residue = b - A*xlse;

% Fitted Model Plot
figure('units','normalized','outerposition',[0 0 1 1],'color','w')
scatter3(x,y,z,'b','filled',LineWidth=5),hold on,grid on
xlabel("X"),ylabel("Y"),zlabel("Z"),title("LSE Plane Fitting")

tspan = linspace(0,1,10)';
[xx,yy] = meshgrid(tspan);
zz = xlse(1)*xx + xlse(2)*yy + xlse(3);  % Fitted Plane
surf(xx,yy,zz,FaceColor="r",FaceAlpha=0.25,EdgeColor="k")



