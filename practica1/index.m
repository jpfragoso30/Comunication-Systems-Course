% Get the path of the audio and its name w/ext from the user
fullPath = getPath();
 
% Pass the path as an argument to our function voz, retrieve the (Hz,V)
[time, audio, frequency] = voz(fullPath);
 
% Run mitadVoz with the data retrieved from voz
subplot(2, 1, 1);
mitadVoz(time, audio);

% Get the spectrum of the signal
subplot(2,1,2);
espectro(audio,frequency,"Frecuencia","Amplitud","Espectro de magnitud de la señal de voz");
