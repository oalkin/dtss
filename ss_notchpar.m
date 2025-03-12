function [r,gain,zrs,pls] = ss_notchpar(Omg0,Omgb)
  r = 1-Omgb/2;                        % Eqn. (8.20)
  zrs = [exp(j*Omg0);exp(-j*Omg0)];    % See Fig. 8.11
  pls = r*[exp(j*Omg0);exp(-j*Omg0)];  % See Fig. 8.11
  tmp = ss_freqz(zrs,pls,1,0);         % Eqn. (8.19)
  gain = 1/tmp;
end