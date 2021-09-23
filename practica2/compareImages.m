function [ECM, errorPercentage, compressPercentage] = compareImages(originalImage, compressedImage, recoveredImage)
    % compareImages receives both originalImage, compressedImage, and recoveredImage,

    % it calculates its ECM, error/compression percentage

    % and then returns that data

    ECM = sum(sum((originalImage-recoveredImage).^2))/numel(originalImage); % ECM
    imagePower = sum(sum(originalImage.^2))/numel(originalImage); % Original Image Power

    errorPercentage = (ECM / imagePower) * 100; % Error (%)

    zeroValues = length(find(compressedImage)); % calculate non-zero values: total - zero-values
    nonZeroValues = numel(compressedImage) - zeroValues;

    compressPercentage = abs(((1 - nonZeroValues) / numel(originalImage)) * 100);
end