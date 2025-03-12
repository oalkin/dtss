% Script: mexdt_7_16.m
n = [0:299];                               % Vector of sample indices
x1 = sin(2*pi*0.125*n).*(n<=99); 
x2 = sin(2*pi*0.325*n).*((n>=50)&(n<=149));
x3 = sin(2*pi*0.0625*n).*((n>=125)&(n<=224));
x4 = sin(2*pi*0.25*n).*((n>=175)&(n<=299));
x = x1+x2+x3+x4;                           % Generate the signal x[n]
Xkm = [];                                  % Start with empty matrix
for m=0:284
  xw = x(m+1:m+16)';       % Get 16 samples of the signal for m<=n<=m+16
  tmp = fft(xw,256).*exp(-j*2*pi/256*m);   % Eqn. (7.106)
  Xkm = [Xkm,tmp];                         % Add new column to matrix
end
k = [127:-1:0];                            % Transform indices
Omg = 2*pi*k/256;                          % Vector of angular frequencies
[M,K] = meshgrid([0:284],[127:-1:0]/256*2*pi);
mesh(M,K,abs(Xkm(128:-1:1,:)),'FaceAlpha',0.5);
axis([0,284,0,pi]);
shading interp;
xlabel('$m$','Interpreter','latex');
ylabel('$\Omega$','Interpreter','latex');
zlabel('$|X_{STFT}\left(m,\Omega\right)|$','Interpreter','latex');
set(gca,'YTick',[0,pi/2,pi,3*pi/2,2*pi]);
set(gca,'YTickLabel',{'$0$','$\frac{\pi}{2}$','$\pi$',...
    '$\frac{3\pi}{2}$','$2\pi$'},'TickLabelInterpreter','latex');