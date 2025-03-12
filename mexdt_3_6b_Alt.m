% Script: mexdt_3_6b_Alt.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('AG_Duet_22050_Hz.flac','ReadRange',[1,661500]);
% Create an "audio file writer" object
sWriter = dsp.AudioFileWriter('Output_sound.flac');
sWriter.SampleRate = sReader.SampleRate;
sWriter.FileFormat = 'FLAC';

L = 1024;                               % Corresponds to 46 ms delay
r = 0.8;                                % Gain factor
numChannels = info(sReader).NumChannels;  % Number of channels
buffer = zeros(L,numChannels);          % Initial buffer matrix
while ~isDone(sReader)                  % Repeat until no more frames left
  x = sReader();                        %   Get the next frame of data 
  [y,buffer] = ss_combf(x,r,buffer);    %   Compute output frame
  sWriter(y);                           %   Write frame to file
end

release(sReader);  % We are finished with the input audio file
release(sWriter);  % We are finished with the audio file writer
[data,fs] = audioread("Output_sound.flac");
sound(data,fs);