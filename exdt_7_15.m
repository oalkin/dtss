% Script: exdt_7_15.m
xn = [1.7,2.4,-1.2,4.3]   % Signal x[n]
gn = xn([1;3])            % Odd indexed samples of x[n]
hn = xn([2;4])            % Even indexed samples of x[n]
Gk = [gn(1)+gn(2);gn(1)-gn(2)]
Hk = [hn(1)+hn(2);hn(1)-hn(2)]
k = [0:3]';
Xk = [Gk;Gk]+exp(-j*2*pi/4*k).*[Hk;Hk]
fft(xn')                  % For comparison