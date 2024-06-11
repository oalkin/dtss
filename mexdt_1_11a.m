% Script: mexdt_1_11a.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.flac');
% Get and display some information about the audio file.
fileName = sReader.Filename           % Name for the audio file
sampleRate = sReader.SampleRate       % Sampling rate of the audio file
frameSize = sReader.SamplesPerFrame   % Number of samples in each frame
dataType = sReader.OutputDataType     % Type of audio data
readRange = sReader.ReadRange         % Range of samples to be read
release(sReader);   % We are finished with the input audio file