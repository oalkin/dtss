% Script: mexdt_1_12c.m
%---------------------------------------------------------------------
% WARNING: Online version of MATLAB does not support the 
% 'audioDeviceWriter' object used for frame-by-frame playback.
% Consequently, this script can only be executed on a local
% installation of MATLAB. For the online version of MATLAB, use
% the alternate script 'mex_1_12c_Alt.m' instead.
%---------------------------------------------------------------------
sSource = audioSynthesizer('BeatsPerMin',100,'SignalType','Square');
sPlayer = audioDeviceWriter('SampleRate',sSource.SampleRate);
 
while ~isDone(sSource)           % Loop through until done:
  x = step(sSource);             %   Get the next frame of data
  sPlayer(x);                    %   Play back the frame
end

rewind(sSource);                 % Rewind the source so we can play again
sSource.SignalType = 'Sawtooth'; % Change to sawtooth waveform
sSource.BeatsPerMin = 125;       % A little bit faster
while ~isDone(sSource)           % Loop through until done:
  x = step(sSource);             %   Get the next frame of data
  sPlayer(x);                    %   Play back the frame
end

rewind(sSource);                 % Rewind the source so we can play again
sSource.SignalType = 'Custom';   % Change to custom waveform
sSource.SignalGen = @mysignal;   % Use custom function for each tone
sSource.BeatsPerMin = 150;       % A little bit faster
while ~isDone(sSource)           % Loop through until done:
  x = step(sSource);             %   Get the next frame of data
  sPlayer(x);                    %   Play back the frame
end
release(sPlayer);

function x = mysignal(ampl,freq,t)
  % Mix sinusoid and square wave
  x = 0.45*ampl*sin(2*pi*freq*t)+0.1*ampl*square(2*pi*freq*t);
end 