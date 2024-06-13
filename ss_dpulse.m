function x = ss_dpulse(n,M)
  x = ss_dstep(n)-ss_dstep(n-M);  % Eqn. (1.68)
end