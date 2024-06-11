function x = ss_dpulse(n,M)
  x = ss_dstep(n)-ss_dstep(n-M);  % Eqn. (/*\matexfileeqn{\ref{eq:mex0153a}}*/)
end