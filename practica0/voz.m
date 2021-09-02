function [timeDomain, samplingData] = voz(path)
%voz receives the path of the audio file,
%then it should display it on a graph
%the function returns the samplingData, and timeDomain

    [samplingData ,samplingFrequency]=audioread(path);
    
    audioLength = length(samplingData)/samplingFrequency;
    
    timeDomain = linspace(0, audioLength, length(samplingData));
    
    plot(timeDomain, samplingData);
    title ('Alejandro/Juan (a)');
    grid on
    xlabel('t');
    ylabel('V');
    
end

