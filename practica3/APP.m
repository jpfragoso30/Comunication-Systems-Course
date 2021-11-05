main();

function [] = main()
    clc
    [arch] = getArch();
    [modo] = getModo();
    [modul] = getModul();
    clc

    [y] = ofdm(arch, modo, modul);

    %plot result
    t = linspace(0, 1, length(y));
    figure('Name','OFDM Signal','NumberTitle','off');
    plot(t, y);
end