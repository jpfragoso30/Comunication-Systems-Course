function [compressedImage] = compimag(nomarch, tipo, umbral)
    % compimag receives the filename of a monochromatic image,
    % the file extension or type, and threshold

    % then it does various processes with it, like displaying it,
    % dividing it by 8x8 blocks and applying the DCT to those blocks,
    % to compress it, getting the entropy of the coeficient's matrix,
    % reconstruct the original image, displaying it, getting the ECM
    % between the decompressed image and the original, and estimate
    % the compression percentage

    % the function will return the compressed image

    compimagName = strcat('Threshold:', string(umbral));

    fileName = strcat(nomarch, '.', tipo); % fileName = fileTitle.fileExt

    [originalMatrix] = readImage(fileName); % 1) read image and prepare it for image processing

    figure('Name', strcat('compimag - ', compimagName), 'NumberTitle', 'off');

    subplot(1, 4, 1)
    imshow(originalMatrix) % 2) display image on screen
    title(strcat(compimagName, ' - Image'))

    [originalProbabilities, originalEntropy] = getEntropy(originalMatrix); % 3) calculate and

    subplot(1, 4, 2)
    histogram(originalProbabilities) % 3) display original entropy on screen
    title(strcat(compimagName, ' - Probabilities'))

    processedMatrix = getCoefficientMatrix(originalMatrix, umbral); % 4) divide image into 8x8 blocks, 
    %5) apply DCT to blocks, 6) filtering higher than threshold

    [processedProbabilities, processedEntropy] = getEntropy(processedMatrix); % 7) calculate and

    subplot(1, 4, 3)
    histogram(processedProbabilities) % 7) display processed entropy on screen
    title(strcat(compimagName, ' - Probabilities (Processed)'))
    
    recoveredMatrix = recoverImage(processedMatrix); % 8) apply IDCT to blocks

    subplot(1, 4, 4)
    imshow(recoveredMatrix) % 9) display recovered image on screen
    title(strcat(compimagName, ' - Image (Recovered)'))

    [ECM, errorPercentage, compressPercentage] = compareImages(originalMatrix, processedMatrix, recoveredMatrix); % 10) , 11) get ECM, error(%) and compression (%)

    fprintf('[%s] | Original Entropy: %s, Processed Entropy: %s\n', compimagName, num2str(originalEntropy), num2str(processedEntropy));
    fprintf('[%s] | ECM: %s, Error Percentage: %s, Compress Percentage: %s\n', compimagName, strcat(num2str(ECM), ' %'), strcat(num2str(errorPercentage), ' %'), strcat(num2str(compressPercentage), ' %'));

    compressedImage = recoveredMatrix;
end