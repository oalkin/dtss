% Script: mexdt_7_19_Alt.m
% Design a highpass filter to suppress low frequencies
Frq = [0,0.05,0.08,1];        % MATLAB-normalized critical frequencies 
Mag = [0,0,1,1];              % Desired magnitude values
M = 27;
hn = firpm(M-1,Frq,Mag);      % Impulse response of the filter with M=27

% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.flac');
sReader.ReadRange = [1,441000];
% Create an "audio writer" object
sWriter = dsp.AudioFileWriter('Output_sound.flac');
sWriter.SampleRate = sReader.SampleRate;
sWriter.FileFormat = 'FLAC';
    % Create an "audio player" object
    % sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate);
L = sReader.SamplesPerFrame;  % Frame size
Hk = fft(hn',L+M-1);          % Zero pad h[n] to L+M+1 and compute FFT

buffer = zeros(M-1,2);        % Create length M-1 buffer vectors 
while ~isDone(sReader)
  xn = sReader();             % Get next frame of data from the reader
  % Implement fast convolution using FFT
  Xk = fft(xn,L+M-1);         % Compute the FFT of zero-padded x[n]
  Yk = Hk.*Xk;                % Multiply the two FFTs
  yn = real(ifft(Yk));        % Inverse FFT to find y[n]
  yn(1:M-1,:) = yn(1:M-1,:)+buffer;  % Add buffer to beginning of y[n]
  buffer = yn(L+1:L+M-1,:);          % Save last M-1 samples to buffer
  yn = yn(1:L,:);             % Truncate y[n] to L samples
  sWriter(yn);                % Write frame to output file
end

release(sReader);  % We are finished with the input audio file
release(sWriter);  % We are finished with the audio file writer