% Script: exdt_7_10.m
Xk = [2+j*3;1+j*5;-2+j*4;-1-j*3]  % Original transform
XEk = 0.5*(Xk+conj(ss_crev(Xk)))  % Conjugate symmetric component
xreal = ifft(XEk)                 % Inverse DFT of the conjugate
                                  %   symmetric component