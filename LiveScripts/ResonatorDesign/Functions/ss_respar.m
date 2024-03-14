function [r,gain,zrs,pls] = ss_respar(Omg0,Omgb)
  r = 1-Omgb/2;                        % Eqn. (/*\matexfileeqn{\ref{eq:resbp11}}*/)
  zrs = [1;-1];                        % Eqn. (/*\matexfileeqn{\ref{eq:resbp4}}*/)
  pls = r*[exp(j*Omg0);exp(-j*Omg0)];  % Eqn. (/*\matexfileeqn{\ref{eq:resbp4}}*/)
  tmp = ss_freqz(zrs,pls,1,Omg0);      % Eqn. (/*\matexfileeqn{\ref{eq:resbp12}}*/)
  gain = 1/tmp;
end