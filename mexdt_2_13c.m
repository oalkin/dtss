% Script: mexdt_2_13c.m
%---------------------------------------------------------------------
% WARNING: Online version of MATLAB does not support the 
% 'audioDeviceWriter' object used for frame-by-frame playback.
% Consequently, this script can only be executed on a local
% installation of MATLAB. For the online version of MATLAB, use
% the alternate script 'mex_2_13c_Alt.m' instead.
%---------------------------------------------------------------------
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('AG_Duet_22050_Hz.flac','ReadRange',[1,661500]);
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate); 

L = 1024;                                % Corresponds to 46 ms delay
r = 0.8;                                 % Attenuation factor
numChannels = info(sReader).NumChannels; % Number of channels
buffer = zeros(3*L,numChannels);         % Initial buffer matrix
while ~isDone(sReader)                   % Repeat until no more frames left
  x = sReader();                         %   Get the next frame of data 
  [y,buffer] = ss_echo3f(x,L,r,buffer);  %   Compute output frame with echo
  sPlayer(y);                            %   Play back the frame
end

release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device