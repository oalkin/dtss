% Script: mexdt_5_1a.m
[zr,zi] = meshgrid([-1.5:0.05:1.5],[-1.5:0.05:1.5]);  % Set up grid
z = zr+j*zi;
Xz = @(z) z.*(z-0.7686)./(z.*z-1.5371*z+0.9025); % Evaluate X[z] on the grid
XzMag = abs(Xz(z));
XzMag = XzMag.*(XzMag<=12)+12.*(XzMag>12);       % Clip values greater than 12
shading interp;    % Shading method: Interpolated
colormap copper;   % Specify the color map used
m1 = mesh(zr,zi,XzMag);
axis([-1.5,1.5,-1.5,1.5]);
% Adjust transparency of surface lines
set(m1,'EdgeAlpha',0.5','FaceAlpha',0.5);
% Specify x,y,z axis labels
xlabel('Re[z]');
ylabel('Im[z]');
zlabel('|X(z)|');
% Specify viewing angles
view(gca,[56.5 40]);