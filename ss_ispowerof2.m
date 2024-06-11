function a = ss_ispowerof2(N)
  a = ~bitand(N,N-1);
end