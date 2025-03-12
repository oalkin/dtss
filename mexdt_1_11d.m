% Script: mexdt_1_11d.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.flac');
sReader.ReadRange = [1,441000];
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate);  

% Prepare the average power plot 
figure;
hPlot = stem([0,0],'diamondr','linewidth',3);
axis([0.5,2.5,0,0.01]);
ylabel('Normalized average power');
xlabel('Channel');
set(gca,'XTick',[1,2])
set(gca,'XTickLabel',{'Left','Right'});
drawnow;

while ~isDone(sReader)
  x = sReader();     % Get the next frame of data from the reader
  sPlayer(x);        % Play back the frame
  xLeft = x(:,1);    % Left channel data
  xRight = x(:,2);   % Right channel data
  pLeft = xLeft'*xLeft/1024;          % Power for left channel
  pRight = xRight'*xRight/1024;       % Power for right channel
  set(hPlot,'YData',[pLeft,pRight]);  % Update plot values
  drawnow limitrate nocallbacks;
end

release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device