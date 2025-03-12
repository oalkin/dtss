% Script: mexdt_2_12b.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.flac','ReadRange',[1,441000]);
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate); 
% Create a "time scope" object to display signals
sScope = timescope('YLimits',[-1,1]);

alpha = 0.2;
ynm1 = zeros(1,info(sReader).NumChannels);
while ~isDone(sReader)                   % Repeat until no more frames left
  x = sReader();                         %   Get the next frame of data 
  [y,ynm1] = ss_smoothbf(x,alpha,ynm1);  %   Compute filter outputs
  sScope(y);                             %   Display frame data
  sPlayer(y);                            %   Play back the frame
end

release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device
release(sScope);   % We are finished with the time scope