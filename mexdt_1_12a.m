% Script: mexdt_1_12a.m
%---------------------------------------------------------------------
% WARNING: Online version of MATLAB does not support the 
% 'audioDeviceWriter' object used for frame-by-frame playback.
% Consequently, this script can only be executed on a local
% installation of MATLAB. For the online version of MATLAB, use
% the alternate script 'mex_1_12a_Alt.m' instead.
%---------------------------------------------------------------------
sSource = audioSynthesizer;
sPlayer = audioDeviceWriter('SampleRate',sSource.SampleRate);
 
while ~isDone(sSource)  % Loop through until done:
  x = step(sSource);    %   Get the next frame of data from synthesizer
  sPlayer(x);           %   Play back the frame
end
release(sPlayer);