function [modul] = getModul()
    validOptions = [0, 1];
    
    valid = 0;
    while valid == 0
        display('Seleccione un tipo de modulacion');
        display('0 - Modulacion QPSK.')
        display('1 - Modulacion 16-QAM.')
        modul = input('Modul:');

        if ismember(modul, validOptions) == 1
            valid = 1;
        end
    end
end