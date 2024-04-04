function h = ss_fir1(N,F,fType,wType)
  Omg = 2*pi*F;                     % Angular frequencies 
  n = [0:N-1]';                     % Interval for truncation
  % Find filter coefficients
  if strcmpi(fType,'highpass')      % Highpass filter
    h = Type12HP(Omg,N,n);
  elseif strcmpi(fType,'bandpass')  % Bandpass filter
    h = Type12BP(Omg(1),Omg(2),N,n);
  elseif strcmpi(fType,'diff')      % Differentiator
    h = Type34Diff(N,n);
  elseif strcmpi(fType,'hilbert')   % Hilbert transform filter
    h = Type34Hilbert(N,n);
  else                              % Lowpass filter by default
    h = Type12LP(Omg,N,n);
  end
  % Multiply with window sequence
  if strcmpi(wType,'bartlett')      % Bartlett (triangular) window
    w = bartlett(N);
  elseif strcmpi(wType,'hamming')   % Hamming window
    w = hamming(N);
  elseif strcmpi(wType,'hanning')   % Hanning (von Hann) window
    w = hann(N);
  elseif strcmpi(wType,'blackman')  % Blackman window
    w = blackman(N);
  else                              % Rectangular window by default
    w = ones(N,1);  
  end
  h = h.*w;
end

function hd = Type12LP(Omgc,N,n)
  % Type-I or type-II lowpass ideal impulse response
  M = (N-1)/2;
  K = n-M;
  hd = Omgc/pi*sinc(Omgc/pi*K);  % Eqn. (/*\matexfileeqn{\ref{eq:fourdes9}}*/)
end

function hd = Type12HP(Omgc,N,n)
  % Type-I or type-II highpass ideal impulse response
  M = (N-1)/2;
  K = n-M;
  hd = sinc(K)-Type12LP(Omgc,N,n);  % Eqn. (/*\matexfileeqn{\ref{eq:fourdes11}}*/)
end

function hd = Type12BP(Omg1,Omg2,N,n)
  % Type-I or type-II bandpass ideal impulse response
  M = (N-1)/2;
  hd = Type12LP(Omg2,N,n)-Type12LP(Omg1,N,n);  % Eqn. (/*\matexfileeqn{\ref{eq:fourdes13}}*/)
end

function hd = Type12BS(Omg1,Omg2,N,n)
  % Type-I or type-II bandstop ideal impulse response
  M = (N-1)/2;
  hd = Type12LP(Omg1,N,n)+Type12HP(Omg2,N,n);  % Eqn. (/*\matexfileeqn{\ref{eq:fourdes14}}*/)
end

function hd = Type34Diff(N,n)
  % Type-III or type-IV differentiator ideal impulse response
  M = (N-1)/2;
  K = n-M+eps;  % Avoid division by zero
  hd = cos(pi*K)./K-1/pi*sin(pi*K)./(K.*K);  % Eqn. (/*\matexfileeqn{\ref{eq:fourdes24}}*/)
end

function hd = Type34Hilbert(N,n)
  % Type-III or type-IV Hilbert transformer ideal impulse response
  M = (N-1)/2;
  K = n-M;
  hd = pi/2*K.*sinc(K/2).*sinc(K/2);         % Eqn. (/*\matexfileeqn{\ref{eq:fourdes29}}*/)
end