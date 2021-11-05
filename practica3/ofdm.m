function [y] = ofdm(arch, modo, modul)
    y = [];

    [t, v] = readAudio(arch);

    %A
    [c] = mapmodul(v, modo, modul);

    %B x C
    [cifft] = ifftFrames(c, modo);

    %D
    [y] = generateSequence(cifft, modo);
end