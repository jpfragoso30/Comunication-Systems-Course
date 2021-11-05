function [t, v] = readAudio(arch)
    [v, frecV] = audioread(arch);
        
    longitudAudio = length(v)/frecV;
        
    t = linspace(0, longitudAudio, length(v));
end