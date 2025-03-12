% Script: exdt_7_6.m
n = [0:31];
xn = cos(17*pi/64*n)+cos(19*pi/64*n);   % 32 samples of the signal
tiledlayout(3,2) 
nexttile;
graphDFT(xn,32,0);
nexttile;
graphDFT(xn,32,32);
nexttile;
graphDFT(xn,32,96);
nexttile;
graphDFT(xn,32,480);
n = [0:63];
xn = cos(17*pi/64*n)+cos(19*pi/64*n);   % 64 samples of the signal
nexttile;
graphDFT(xn,64,0);
nexttile;
graphDFT(xn,64,448);

function graphDFT(xn,N,M)
  % Local function to compute and graph the DFT
  DFTSize = N+M;
  k = [0:DFTSize-1];
  Omega = 2*pi*k/DFTSize;
  Xk = fft(xn,DFTSize);
  if (DFTSize<256)
    stem(Omega,abs(Xk));
  else
    plot(Omega,abs(Xk));
  end;
  axis([0,2*pi,0,40]);
  tmpstr = "|X[k]| for N="+N+", M="+M;
  title(tmpstr);
  xlabel('\Omega (rad)');
  ylabel('Magnitude'); 
end