function [y,ynm1] = ss_smoothb(x,alpha,ynm1)
  y = (1-alpha)*ynm1+alpha*x;  % Eqn. (2.9)
  ynm1 = y;                    % Bookkeeping to prepare for next call
end