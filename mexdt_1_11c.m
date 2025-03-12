% Script: mexdt_1_11c.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.flac');
sReader.ReadRange = [1,441000];   % Read 20 seconds of music
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate);  

% Prepare the plot before the loop
figure;
frameSize = sReader.SamplesPerFrame;   % The frame size put out by sReader
x = zeros(frameSize,2);        % Dummy matrix for the plot
n = [0:frameSize-1];           % Array of indices
p1 = plot(n,x(:,1),n,x(:,2));  % p1 is a length-2 array of handles
axis([0,frameSize-1,-1,1]);    % Set axis limits
xlabel('Sample index');
ylabel('Amplitude');
drawnow;

while ~isDone(sReader)
  x = sReader();   % Get the next frame of data from the reader
  sPlayer(x);      % Play back the frame
  set(p1(1),'YData',x(:,1));  % Update left channel graph
  set(p1(2),'YData',x(:,2));  % Update right channel graph
  drawnow limitrate nocallbacks;
end

release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device