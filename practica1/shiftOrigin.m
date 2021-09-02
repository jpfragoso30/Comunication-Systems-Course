function [shiftedFrequency, shiftedSignal] = shiftOrigin(transSignal, frec)
%shiftOrigin receives the transformed signal, and frequency vector,
%then it shifts the signal to the middle of the new vector of frecuencies,
%which starts at -length/2, and ends in length/2
%the function finally returns the new shifted signal, and the shifted frecuency.

    shiftedFrequency = linspace(-frec/2, frec/2, length(transSignal));
    shiftedSignal = fftshift(transSignal);
    
end

