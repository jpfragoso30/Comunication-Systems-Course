function [yseq] = generateSequence(cifft, modo)
    yseq = [];

    T = 0.01;
    deltaf = 1/T;
    if modo == 0
        N = 2048;
    else
        N = 8192;
    end
    deltat = T/N;
    m = 1;
    total = length(cifft);

    for n = 1:total
        if(rem(n, N) == 0)
            m = m + 1;
        end

        angle = 2*pi*n*deltaf*m*deltat;
        an = real(cifft(n));
        bn = imag(cifft(n));

        yseq(n) = an*cos(angle) + bn*sin(angle);
    end
end