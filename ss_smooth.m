function y = ss_smooth(x,alpha)
  persistent ynm1;   % Persistent variable to hold y[n-1]
  if isempty(ynm1)   % If the function is called for the first time
    ynm1 = 0;        %   Initialize ynm1
  end;  
  y = (1-alpha)*ynm1+alpha*x;  % Eqn. (/*\matexfileeqn{\ref{eq:ex0222a}}*/)
  ynm1 = y;                    % Bookkeeping to prepare for next call
end