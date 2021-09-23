function [probabilities, entropy] = getEntropy(matrix)
    % getEntropy receives a matrix,

    % it calculates the frequency, and likelihood of the image

    % and then returns the array of probabilities, and the entropy

    frequencies = hist(matrix); % get frecuencies by possible value

    frequencies(1:length(frequencies)) = frequencies(1:length(frequencies)) / numel(frequencies); % divide previous map frequencies by the matrix size (value:probability)
    
    probabilities = frequencies;

    entropyProduct = probabilities * log2(1 ./ probabilities)';
    entropy = sum(entropyProduct(isfinite(entropyProduct)));
end