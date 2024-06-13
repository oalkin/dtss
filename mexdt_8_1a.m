% Script: mexdt_8_1a.m
fs = 22050;                                   % Sampling rate
nBits = 16;                                   % Number of bits per sample
nChannels = 1;                                % Number of channels
sRecord = audiorecorder(fs,nBits,nChannels);  % Create recorder object
disp('Press any key and start speaking');
pause;
disp('Recording started');
duration = 5;                                 % Recording duration in seconds
recordblocking(sRecord,duration);             % Record audio   
disp('Recording finished');
play(sRecord);                                % Play back the recording
x = getaudiodata(sRecord,'double');           % Create a vector with samples
plot(x);                                      % Graph the data