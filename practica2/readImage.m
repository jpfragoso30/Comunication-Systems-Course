function [luminanceMatrix] = readImage(path)
    % readImage receives the image path,

    % it gets its luminance values inside a matrix

    % and then returns the luminanceMatrix
     
    image = imread(path); % uint8 256x256
    bwImage = im2gray(image); % rgb2gray to ensure that the image is B&W
    [normImage] = normalizeImage(bwImage); % normalize matrix to have values between -256 and 255

    luminanceMatrix = double(normImage); % convert matrix to be double 
end