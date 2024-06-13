% Script: mexdt_2_12a.m
%---------------------------------------------------------------------
% WARNING: Online version of MATLAB does not support the 
% 'audioDeviceWriter' object used for frame-by-frame playback.
% Consequently, this script can only be executed on a local
% installation of MATLAB.
%---------------------------------------------------------------------
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.flac','ReadRange',[1,441000]);
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate); 
% Create a "time scope" object to display signals
sScope = timescope('YLimits',[-1,1]);

N = 8;
numChannels = info(sReader).NumChannels;  % Number of channels
buffer = zeros(N,numChannels);          % Initial buffer matrix
while ~isDone(sReader)                  % Repeat until no more frames left:
  x = sReader();                        %   Get the next frame of data 
  [y,buffer] = ss_movavgbf(x,N,buffer); %   Compute moving averages
  sScope(y);                            %   Display frame data
  sPlayer(y);                           %   Play back the frame
end

release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device
release(sScope);   % We are finished with the time scope