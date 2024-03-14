function [r,gain,zrs,pls] = ss_notchpar(Omg0,Omgb)
  r = 1-Omgb/2;                        % Eqn. (/*\matexfileeqn{\ref{eq:notch7}}*/)
  zrs = [exp(j*Omg0);exp(-j*Omg0)];    % See Fig. /*\matexfileeqn{\ref{fig:notch3}}*/
  pls = r*[exp(j*Omg0);exp(-j*Omg0)];  % See Fig. /*\matexfileeqn{\ref{fig:notch3}}*/
  tmp = ss_freqz(zrs,pls,1,0);         % Eqn. (/*\matexfileeqn{\ref{eq:notch6}}*/)
  gain = 1/tmp;
end