function [r,gain,zrs,pls] = ss_respar(Omg0,Omgb)
  r = 1-Omgb/2;                        % Eqn. (8.12)
  zrs = [1;-1];                        % Eqn. (8.6)
  pls = r*[exp(j*Omg0);exp(-j*Omg0)];  % Eqn. (8.6)
  tmp = ss_freqz(zrs,pls,1,Omg0);      % Eqn. (8.13)
  gain = 1/tmp;
end