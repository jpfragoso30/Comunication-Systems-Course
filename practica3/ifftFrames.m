function [cifft] = ifftFrames(c, modo)
    if modo == 0
        frameSize = 2048;
    else
        frameSize = 8192;
    end
    
    fun = @(block_struct) ifft(block_struct.data);
    
    cifft = blockproc(c,[frameSize 1], fun);
end