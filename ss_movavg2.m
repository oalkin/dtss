function y = ss_movavg2(x)
  persistent xnm1;   % Persistent variable to hold x[n-1]
  if isempty(xnm1)   % If the function is called for the first time
    xnm1 = 0;        %   Initialize xnm1
  end;  
  y = (x+xnm1)/2;    % Eqn. (/*\matexfileeqn{\ref{eq:ex0222a}}*/)
  xnm1 = x;          % Bookkeeping to prepare for next call
end