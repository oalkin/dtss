function x = ss_dtriangle(n,M)
  x = 1/M*(ss_dramp(n+M)-2*ss_dramp(n)+ss_dramp(n-M));  % Eqn. (1.69)
end