function [arch] = getArch()
    valid = 0;
    
    while valid == 0
        display('Seleccione un audio .wav');
        [file, path] = uigetfile('*.wav');

        if file ~= 0
            valid = 1;
        end
    end

    arch = strcat(path, file);
end