function [] = espectro(audio,fs,xl,yl,tit)
%espectro recieves the audio, frequency and chart labels,
%then it renders the audio spectrum (magnitude),
%the function doesn't return any value.
    
    fourier=fft(audio);
    spectrum = abs(fourier);
    [shiftedFrecuency, shiftedSpectrum] = shiftOrigin(spectrum, fs);
    
    plot(shiftedFrecuency, shiftedSpectrum);
    title (tit);
    grid on
    xlabel(xl);
    ylabel(yl);
    axis([-1000, 1000, 0, 150]); %hardcoded, for better presentation of graphic
 
end