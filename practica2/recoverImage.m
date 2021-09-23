function [recoveredImage] = recoverImage(modifiedImage)
    % recoverImage receives the modifiedImage

    % then it applies the 2D Inverse DCT for the processed
    % image to recover its original state

    % the function will return the recoveredImage
    
    idctHandler = @idct2;

    rawImage = blkproc(modifiedImage, [8 8], idctHandler); % apply idct to each 8x8 block

    recoveredImage = round(rawImage); % round to nearest integer
end