% Script: mexdt_5_1b.m
[zr,zi] = meshgrid([-1.5:0.05:1.5],[-1.5:0.05:1.5]);  % Set up grid
z = zr+j*zi;
Xz = @(z) z.*(z-0.7686)./(z.*z-1.5371*z+0.9025); % Evaluate X[z] on the grid
XzMag = abs(Xz(z));
XzMag = XzMag.*(XzMag<=12)+12.*(XzMag>12);       % Clip values greater than 12
% Set the trajectory.
r = 1;                    % Radius of the trajectory
Omg = [0:0.0025:1]*2*pi;  % Vector of angular frequencies
tr = r*exp(j*Omg);        % Circular trajectory on the z plane
% Produce a mesh plot and hold it
shading interp;           % Shading method: Interpolated
colormap copper;          % Specify the color map used
m1 = mesh(zr,zi,XzMag);
set(m1,'EdgeAlpha',0.5','FaceAlpha',0.5);
hold on;
% Superimpose a plot of X(z) magnitude values evaluated
%   on the trajectory using 'plot3' function
m2 = plot3(real(tr),imag(tr),abs(Xz(tr)),'b-','LineWidth',1.25);
% Show the unit circle in red
m3 = plot3(real(tr),imag(tr),zeros(size(tr)),'r-','LineWidth',1.25);
hold off;
axis([-1.5,1.5,-1.5,1.5]);
% Specify x,y,z axis labels
xlabel('Re[z]');
ylabel('Im[z]');
zlabel('|X(z)|');
% Specify viewing angles
view(gca,[56.5 40]);