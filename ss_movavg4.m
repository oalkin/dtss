function y = ss_movavg4(x)
  persistent xnm1 xnm2 xnm3;  % Variables to hold x[n-1], x[n-2], x[n-3]
  if isempty(xnm1)    % If the function is called for the first time
    xnm1 = 0;         %   Initialize xnm1
    xnm2 = 0;         %   Initialize xnm2
    xnm3 = 0;         %   Initialize xnm3
  end;  
  y = (x+xnm1+xnm2+xnm3)/4;   % Eqn. (2.10)
  % Bookkeeping to prepare for next call
  xnm3 = xnm2;      
  xnm2 = xnm1;
  xnm1 = x;
end