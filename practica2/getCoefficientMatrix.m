function [coefficientMatrix] = getCoefficientMatrix(blocks, threshold)
    % getCoefficientMatrix receives the matrix 8x8 blocks, and the threshold

    % then it applies the 2D DCT for each individual block,
    % rounds those resulting coefficients, and filters out
    % any value that is lower than the threshold

    % the function will return the rounded coefficient matrix
    
    dctHandler = @dct2;

    rawCoefficientMatrix = blkproc(blocks, [8 8], dctHandler); % apply dct to each 8x8 block

    roundedCoefficientMatrix = round(rawCoefficientMatrix); % round to nearest integer

    coefficientMatrix = roundedCoefficientMatrix;

    coefficientMatrix(abs(coefficientMatrix) < threshold) = 0; % filter by threshold
end