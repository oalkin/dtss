% Script: mexdt_1_11b.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.mp3');
sReader.ReadRange = [1,441000];   % Read 20 seconds of music   
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate);  

while ~isDone(sReader)
  x = sReader();  % Get the next frame of data from the reader
  sPlayer(x);     % Play back the frame
end

release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device