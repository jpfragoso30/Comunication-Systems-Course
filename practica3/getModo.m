function [modo] = getModo()
    validOptions = [0, 1];
    
    valid = 0;
    while valid == 0
        display('Seleccione un modo');
        display('0 - Generar 2048 subportadoras.')
        display('1 - Generar 8192 subportadoras.')
        modo = input('Modo:');

        if ismember(modo, validOptions) == 1
            valid = 1;
        end
    end
end