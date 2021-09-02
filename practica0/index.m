% Get the path of the audio and its name w/ext from the user
fullPath = getPath();

% Pass the path as an argument to our function voz, retrieve the (Hz,V)
subplot(2, 1, 1);
[time, audio] = voz(fullPath);

% Run mitadVoz with the data retrieved from voz
subplot(2, 1, 2);
mitadVoz(time, audio);