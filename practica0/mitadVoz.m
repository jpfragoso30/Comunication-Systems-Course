function [] = mitadVoz(timeDomain, samplingData)
%mitadVoz receives the audio,
%then it renders the middle portion of the audio (100ms),
%the function doesn't return any value

    fraction = 1/10;

    plot(timeDomain, samplingData);
    axis([4.5*fraction, 5.5*fraction, -0.35, 0.35]);
    title ('Alejandro/Juan (a) 100ms');
    grid on
    xlabel('t');
    ylabel('V');

end

