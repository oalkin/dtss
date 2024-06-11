classdef audioSynthesizer < handle
  % audioSynthesizer  Class for synthesizing audio from sheet music.
  %
  %   audioSynthesizer class implements a tone-based audio synthesizer
  %   to allow experimentation with various waveform and modulating 
  %   envelope shapes for sound synthesis.  The most basic example for 
  %   using an object of this class is as follows:
  %
  %       sSource = audioSynthesizer;
  %       sPlayer = audioDeviceWriter('SampleRate',sSource.SampleRate);
  %
  %       while ~isDone(sSource)
  %         x = step(sSource);
  %         sPlayer(x);
  %       end
  %
  %   This example should play a sequence of notes starting at middle C
  %   and going up one octave using sinusoidal tones and a simple ADSR
  %   envelope.
  %
  %   (c) 2023 by Oktay Alkin
  %
  % audioSynthesizer Properties:
  %
  %   Notes - A cell array holding the notes to be played. 
  %     If 'Notes' is a cell array with two columns, the first column holds 
  %     the notes, and the second columns holds the duration of each note in
  %     terms of beats. 
  %     If 'Notes' is a cell array with three columns, then the third column 
  %     is used for the amplitude of each note.
  %     An example is given below:
  %
  %         myNotes = {"C4",1,1; "A#4",0.5,1; "Gb4",0.5,1}
  %         sSource = audioSynthesizer(Notes=myNotes); 
  %
  %     Keys on a typical 88-key piano have been implemented starting with
  %     "A0" and going up to "C8". Use the # sign for sharps and b for flats
  %     as in the example above. Use "rest" for quiet passages.
  %
  %   SampleRate - Sampling rate in Hz. Default value is 44100 Hz.
  %
  %   BeatsPerMin - Beats per minute for playback. Default value is 100.
  %
  %   SamplesPerFrame - Number of samples in each frame produced by the use 
  %     of the 'step' method. Default value is 1024.
  %
  %   SignalType - Type of signal produced for each note. Valid choices are:
  %     'Sin':      Sinusoidal signal (default)
  %     'Square':   Square-wave signal
  %     'Sawtooth': Sawtooth signal
  %     'Custom':   User-defined signal. Requires that the SignalGen property
  %                   be set as a handle to a user-defined function.
  %
  %   SignalGen - A handle to a user-defined function to compute samples of
  %     the signal for each note.
  %
  %   EnvelopeType - Type of modulating envelope applied to each note.
  %     Valid choices are:
  %     'ADSR':   Simple attack-decay-sustain-release envelope with durations
  %                 of 4ms for attack, decay and release.
  %     'Custom': User-defined envelope. Requires that the EnvelopeGen
  %                 property be set as a handle to a user-defined function.
  %
  %   EnvelopeGen - A handle to a user-defined function to compute samples of
  %     the modulating envelope for each note.
  %
  %   CacheOn - Specifies if generated envelope and tone signals should be cached
  %     in memory for use when they are needed again. (Default = true)
  %
  %   Verbose - Specifies if informational messages are displayed while the step 
  %     method of the object is executed. (Default = false)
  % 
  % audioSynthesizer Methods:
  %
  %   step - Returns SamplesPerFrame samples from the output stream.
  %
  %   isDone - Returns true if the stream is finished, false otherwise.
  %
  %   rewind - Returns the synthesizer back to its initial state.

   properties
    Notes {mustBeCell} = {"C4",1;"D4",1;"E4",1;"F4",1;"G4",1;"A4",1;"B4",1;"C5",1}  % Cell array containing the notes to be played
    SampleRate (1,1) double {mustBePositive} = 44100  % Sampling rate in Hz. Default value is 44100 Hz.
    BeatsPerMin (1,1) double {mustBeInteger,mustBePositive} = 100  % Beats per minute. Default value is 100.
    SamplesPerFrame (1,1) double {mustBeInteger,mustBePositive} = 1024  % Frame size for the output stream. Default value is 1024.
    SignalType (1,1) string {mustBeSignalType} = "Sin"
    SignalGen {mustBeSignalGen} = @dummySignalGen
    EnvelopeType (1,1) string {mustBeEnvelopeType} = "ADSR"
    EnvelopeGen {mustBeEnvelopeGen} = @dummyEnvelopeGen
    CacheOn (1,1) {mustBeCacheOn} = true
    Verbose (1,1) {mustBeVerbose} = true
  end

  properties (Dependent)
    samplesPerBeat
  end

  properties (Dependent,Hidden)
    numFreqs
  end

  properties (Hidden)
    keys
    amplitudes
    freqs
    timing      
    freqIdx = 1
    notesDict
    sBuffer
    sCache
  end

  methods

    function obj = audioSynthesizer(namedArgs)
      arguments
        namedArgs.Notes = {"C4",1;"D4",1;"E4",1;"F4",1;"G4",1;"A4",1;"B4",1;"C5",1};
        namedArgs.Freqs = [];
        namedArgs.Timing = [];
        namedArgs.SampleRate = 44100;
        namedArgs.SamplesPerFrame = 1024;
        namedArgs.BeatsPerMin = 100;
        namedArgs.SignalType = "Sin";
        namedArgs.SignalGen = @dummySignalGen;
        namedArgs.EnvelopeType = "ADSR";
        namedArgs.EnvelopeGen = @dummyEnvelopeGen;
        namedArgs.CacheOn = true;
         namedArgs.Verbose = false;
      end
      obj.Notes = namedArgs.Notes;
      obj.freqs = namedArgs.Freqs;
      obj.timing = namedArgs.Timing;
      obj.SampleRate = namedArgs.SampleRate;
      obj.SamplesPerFrame = namedArgs.SamplesPerFrame;
      obj.BeatsPerMin = namedArgs.BeatsPerMin;
      obj.SignalType = namedArgs.SignalType;
      obj.SignalGen = namedArgs.SignalGen;
      obj.EnvelopeType = namedArgs.EnvelopeType;
      obj.EnvelopeGen = namedArgs.EnvelopeGen;   
      obj.CacheOn = namedArgs.CacheOn;
      obj.Verbose = namedArgs.Verbose;
%       if ~isempty(obj.Notes)
%         obj.keys = string(obj.Notes(:,1));
%         obj.notesDict = obj.piano88;
%         vals = obj.notesDict(obj.keys);
%         obj.freqs = vals';
%         times = obj.Notes(:,2);
%         obj.timing = cell2mat(times)';
%         tmp = size(obj.Notes);
%         if (tmp(2) > 2)
%           amps = obj.Notes(:,3);
%           obj.amplitudes = cell2mat(amps)';
%         else
%           obj.amplitudes = ones(1,tmp(1));  
%         end    
%       end
      obj.sBuffer = dsp.AsyncBuffer(300000);
      obj.sCache = audioCache;
      readMusic(obj);
    end

    function samplesPerBeat = get.samplesPerBeat(obj)
      samplesPerBeat = obj.SampleRate*60/obj.BeatsPerMin;
    end

    function numFreqs = get.numFreqs(obj)
      numFreqs = max(size(obj.freqs));
    end  

    function x = step(obj)
    % Returns the next frame of SamplesPerFrame samples from the output stream. 
      if (obj.sBuffer.NumUnreadSamples < 90000)
        value = fillBuffer(obj);  
      end            
      x = read(obj.sBuffer,obj.SamplesPerFrame);
    end

    function value = isDone(obj)
    % Returns true if the output stream is finished, and false otherwise.    
      if (obj.sBuffer.NumUnreadSamples < obj.SamplesPerFrame) && (obj.freqIdx > obj.numFreqs)       
        value = true;
      else
        value = false;
      end  
    end

    function rewind(obj)
      obj.sBuffer.reset();
      obj.sCache.reset();
      obj.freqIdx = 1;
    end

  end % methods

  methods (Access=private)

    function readMusic(obj)
      if ~isempty(obj.Notes)
        obj.keys = string(obj.Notes(:,1));
        obj.notesDict = obj.piano88;
        vals = obj.notesDict(obj.keys);
        obj.freqs = vals';
        times = obj.Notes(:,2);
        obj.timing = cell2mat(times)';
        tmp = size(obj.Notes);
        if (tmp(2) > 2)
          amps = obj.Notes(:,3);
          obj.amplitudes = cell2mat(amps)';
        else
          obj.amplitudes = ones(1,tmp(1));  
        end    
      end        
    end      

    function value = fillBuffer(obj)
      value = false;  
      while (obj.sBuffer.NumUnreadSamples < 210000) && (obj.freqIdx <= obj.numFreqs),
        numSamples = obj.samplesPerBeat*obj.timing(obj.freqIdx);
        key = obj.keys(obj.freqIdx);
        freq = obj.freqs(obj.freqIdx);
        ampl = obj.amplitudes(obj.freqIdx);
        t = [0:numSamples-1]'/obj.SampleRate;
        if (obj.CacheOn)
          y = searchForSignalInCache(obj,numSamples,ampl,key);
        else
          y = [];
        end
        if isempty(y)
          x = generateSignal(obj,ampl,freq,t);
          q = generateEnvelope(obj,t);
          y = x.*q;
          if (obj.CacheOn)
            addSignalToCache(obj,numSamples,ampl,key,y);
          end
        end
        write(obj.sBuffer,y); 
        obj.freqIdx = obj.freqIdx+1;
        value = true;
      end
    end

    function x = generateSignal(obj,ampl,freq,t)
      if (obj.Verbose)
        str = sprintf('Computing signal: ampl=%f, freq=%f, numSamples=%d',...
                ampl, freq, max(size(t)));
        disp(str);
      end
      if (freq < 5),
        x = zeros(size(t));  % "rest"
      elseif (obj.SignalType == "Sin"),
        x = 0.5*ampl*sin(2*pi*freq*t);
      elseif (obj.SignalType == "Square"), 
        x = 0.5*ampl*square(2*pi*freq*t);  
      elseif (obj.SignalType == "Sawtooth"),
        x = 0.5*ampl*sawtooth(2*pi*freq*t); 
      elseif (obj.SignalType == "Custom"),
        x = obj.SignalGen(0.5*ampl,freq,t);
      end
    end 

    function x = generateEnvelope(obj,t)
      numSamples = max(size(t));
      if (obj.CacheOn)
        x = searchForEnvelopeInCache(obj,numSamples);
      else
        x = [];
      end
      if isempty(x)
        if (obj.EnvelopeType == "Custom"),
          x = obj.EnvelopeGen(t);
        else
          duration = t(end);
          qt = [0,0.04,0.08,duration-0.04,duration];
          qx = [0,1.75,1,1,0];
          x = interp1(qt,qx,t);
        end
        if (obj.CacheOn)
          addEnvelopeToCache(obj,numSamples,x)
        end
      end
    end

    function addSignalToCache(obj,numSamples,ampl,key,x)
      intAmpl = floor(1000*ampl);
      obj.sCache.addEntry([numSamples,intAmpl],["Signal",key],x);
    end 

    function x = searchForSignalInCache(obj,numSamples,ampl,key)
      intAmpl = floor(1000*ampl);
      x = obj.sCache.search([numSamples,intAmpl],["Signal",key]);
      if (obj.Verbose)
        if ~isempty(x)
          str = sprintf('Found signal in cache: numSamples=%d, intAmpl=%d, key=%s',...
                  numSamples,intAmpl,key);
        else
          str = sprintf('Signal not found in cache: numSamples=%d, intAmpl=%d, key=%s',...
                  numSamples,intAmpl,key);  
        end
        disp(str);
      end
    end    

    function addEnvelopeToCache(obj,numSamples,x)
      obj.sCache.addEntry([numSamples],["Envelope"],x);
    end 

    function x = searchForEnvelopeInCache(obj,numSamples)
      x = obj.sCache.search([numSamples],["Envelope"]);
      if (obj.Verbose)
        if ~isempty(x)
          str = sprintf('Found envelope in cache: numSamples=%d',numSamples);
        else
          str = sprintf('Envelope not found in cache: numSamples=%d',numSamples);          
        end
        disp(str);
      end
    end

  end % methods (Access=private) 

  methods (Static,Access=private)

    function value = piano88;
      keys = ["A0","A#0","B0",...
              "C1","C#1","D1","D#1","E1","F1","F#1","G1","G#1","A1","A#1","B1",...
              "C2","C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A#2","B2",...
              "C3","C#3","D3","D#3","E3","F3","F#3","G3","G#3","A3","A#3","B3",...
              "C4","C#4","D4","D#4","E4","F4","F#4","G4","G#4","A4","A#4","B4",...
              "C5","C#5","D5","D#5","E5","F5","F#5","G5","G#5","A5","A#5","B5",...
              "C6","C#6","D6","D#6","E6","F6","F#6","G6","G#6","A6","A#6","B6",...
              "C7","C#7","D7","D#7","E7","F7","F#7","G7","G#7","A7","A#7","B7",...
              "C8"];
      n = [1:88];
      keyfreqs = 2.^((n-49)/12)*440;
      value = dictionary(keys,keyfreqs);
      keysflat = ["Bb0",...
                  "Db1","Eb1","Gb1","Ab1","Bb1",...
                  "Db2","Eb2","Gb2","Ab2","Bb2",...
                  "Db3","Eb3","Gb3","Ab3","Bb3",...
                  "Db4","Eb4","Gb4","Ab4","Bb4",...
                  "Db5","Eb5","Gb5","Ab5","Bb5",...
                  "Db6","Eb6","Gb6","Ab6","Bb6",...
                  "Db7","Eb7","Gb7","Ab7","Bb7"];
      n = [2,5,7,10,12,14,17,19,22,24,26,29,31,34,36,38,41,43,46,48,50,53,55,...
           58,60,62,65,67,70,72,74,77,79,82,84,86];
      keyfreqs =  2.^((n-49)/12)*440;
      value(keysflat) = keyfreqs;
      value("rest") = 0;
    end

  end % methods (Static,Access=private) 

end

%---------------------------------------------------------------------
% Property validation functions
%---------------------------------------------------------------------

function mustBeCell(a)
  if ~iscell(a),
    error("Value of 'Notes' property must be a cell array.");
  end
end

function mustBeSignalType(a)
  if ~ismember(a,["Sin","Square","Sawtooth","Custom"])
    error("%s\n\n%s\n%s\n%s\n%s",...
      "Value of 'SignalType' property must be one of the following:",...
      "  'Sin' (default)",...
      "  'Square'",...
      "  'Sawtooth'",...
      "  'Custom'");
  end
end

function mustBeSignalGen(a)
  if ~isa(a,'function_handle')
    error("%s\n\n%s\n\n%s\n\n%s\n%s\n%s",...
      "Value of 'SignalGen' property must be a function handle.",...
      "Example:",...
      "  sSource = audioSynthesizer(SignalGen=@myfunc,...",...    
      "  function x = myfunc(ampl,freq,t)",...
      "    x = 0.5*ampl*sin(2*pi*freq*t);",...
      "  end");
  end
end

function mustBeEnvelopeType(a)
  if ~ismember(a,["ADSR","Custom"])
    error("%s\n\n%s\n%s",...
      "Value of 'EnvelopeType' property must be one of the following:",...
      "  'ADSR' (default)",...
      "  'Custom'");
  end
end

function mustBeEnvelopeGen(a)
  if ~isa(a,'function_handle')
    error("%s\n\n%s\n\n%s\n\n%s\n%s\n%s",...
      "Value of 'EnvelopeGen' property must be a function handle.",...
      "Example:",...
      "  sSource = audioSynthesizer(Envelope=@myfunc,...",...    
      "  function x = myfunc(t)",...
      "    x = ...",...
      "  end");
  end
end

function mustBeCacheOn(a)
  if ~islogical(a)
    error("Value of 'CacheOn' property must be true or false.");  
  end
end

function mustBeVerbose(a)
  if ~islogical(a)
    error("Value of 'Verbose' property must be true or false.");  
  end
end

function x = dummySignalGen(~,~,t)
  x = zeros(size(t));
end  

function x = dummyEnvelopeGen(t)
  x = zeros(size(t));
end  
