function a = ss_apfpar(F,td)
  aVec = [0.01:0.01:0.99];
  tdVec = zeros(size(aVec));
  Omega = 2*pi*F;
  for i=1:length(aVec)
    zero = -1/aVec(i);
    pole = -aVec(i);
    [~,phs] = ss_freqz(zero,pole,1,Omega);
    tdVec(i) = -phs/Omega;
  end
  a = interp1(tdVec,aVec,td);
end