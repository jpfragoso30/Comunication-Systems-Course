function [c] = mapmodul(v, modo, modul)
    c = [];

    vBits = ceil(v);

    if modul == 0
        if rem(length(vBits), 2) == 1
            vBits = vBits(1:length(vBits)-1);
        end

        vDibits = reshape(vBits, [], 2);

        for i = 1:length(vDibits)
            if vDibits(i, 1) == 1
                if vDibits(i, 2) == 1
                    c(i) = complex(1, 1); %11
                else
                    c(i) = complex(-1, 1); %10
                end
            else
                if vDibits(i, 2) == 1
                    c(i) = complex(-1, -1); %01
                else
                    c(i) = complex(1, -1); %00
                end
            end
        end

        if modo == 0
            c(1:4) = 0;
            c(5:8) = 0;
        else
            c(1:4) = 1;
            c(5:8) = 0;
        end
    else
        if rem(length(vBits), 4) >= 1
            while rem(length(vBits), 4) >= 1
                vBits = vBits(1:length(vBits)-1);
            end
        end

        vNibbles = reshape(vBits, [], 4);

        for i = 1:length(vNibbles)
            if vNibbles(i, 1) == 1
                if vNibbles(i, 2) == 1
                    if vNibbles(i, 3) == 1
                        if vNibbles(i, 4) == 1
                            c(i) = complex(3, 3); %1111
                        else
                            c(i) = complex(1, 3); %1110
                        end
                    else
                        if vNibbles(i, 4) == 1
                            c(i) = complex(-1, 3); %1101
                        else
                            c(i) = complex(-3, 3); %1100
                        end
                    end
                else
                    if vNibbles(i, 4) == 1
                        if vNibbles(i, 3) == 1
                            c(i) = complex(3, 1); %1011
                        else
                            c(i) = complex(-1, 1); %1001
                        end
                    else
                        if vNibbles(i, 3) == 1
                            c(i) = complex(1, 1); %1010
                        else
                            c(i) = complex(-3, 1); %1000
                        end
                    end
                end
            else
                if vNibbles(i, 2) == 1
                    if vNibbles(i, 3) == 1
                        if vNibbles(i, 4) == 1
                            c(i) = complex(3, -1); %0111
                        else
                            c(i) = complex(1, -1); %0110
                        end
                    else
                        if vNibbles(i, 4) == 1
                            c(i) = complex(-1, -1); %0101
                        else
                            c(i) = complex(-3, -1); %0100
                        end
                    end
                else
                    if vNibbles(i, 4) == 1
                        if vNibbles(i, 3) == 1
                            c(i) = complex(-3, -3); %0011
                        else
                            c(i) = complex(1, -3); %0001
                        end
                    else
                        if vNibbles(i, 3) == 1
                            c(i) = complex(-1, -3); %0010
                        else
                            c(i) = complex(3, -3); %0000
                        end
                    end
                end
            end
        end

        if modo == 0
            c(1:2) = 0;
            c(3:4) = 1;
        else
            c(1:2) = 1;
            c(3:4) = 1;
        end
    end

    if modo == 0
        subcarriers = 2048;
    else
        subcarriers = 8192;
    end

    ratio = length(c) / subcarriers;
    lowerMultiple = floor(ratio) * subcarriers;
    lowerDifference = length(c) - lowerMultiple;
    upperMultiple = ceil(ratio) * subcarriers;
    upperDifference = upperMultiple - length(c);

    if lowerDifference > upperDifference
        c(length(c) : upperMultiple) = 0;
    else
        c = c(1:lowerMultiple);
    end
end