function [timeDomain, samplingData, samplingFrequency] = voz(path)
%voz receives the path of the audio file,
%the function returns the samplingData, and timeDomain
 
    [samplingData ,samplingFrequency]=audioread(path);
    
    audioLength = length(samplingData)/samplingFrequency;
    
    timeDomain = linspace(0, audioLength, length(samplingData));
    
    
end
