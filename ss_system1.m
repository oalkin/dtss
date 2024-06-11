function y = ss_system1(x)
  persistent wnm1 wnm2 wnm3;
  if isempty(wnm1)
    wnm1 = 1.0682;  % Initial value w[-1]
    wnm2 = 1.7149;  % Initial value w[-2]
    wnm3 = 0.1674;  % Initial value w[-3]
  end;  
  wn = x+0.7*wnm1+0.8*wnm2-0.84*wnm3;  % Eqn. (/*\matexfileeqn{\ref{eq:ex0220c}}*/)
  y = 0.1*wn+0.2*wnm1+0.3*wnm2;        % Eqn. (/*\matexfileeqn{\ref{eq:ex0220d}}*/)
  % Bookkeeping to prepare for next call
  wnm3 = wnm2;
  wnm2 = wnm1;
  wnm1 = wn;
end