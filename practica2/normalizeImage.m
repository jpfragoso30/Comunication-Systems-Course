function [normalizedImage] = normalizeImage(rawImage)
    % normalizeImage receives the rawImage read,

    % then it goes through an algorithm which ensures that
    % its matrix values go from -256 to 255

    % the function will return the normalized matrix

    lowerEnd = min(min(rawImage)); % get minimum value (max value for negative numbers)
    
    normalizingValue = 0; % value that really matters
    if lowerEnd < 0
    % if minimum value is negative:
        % substract minimum value to all negative numbers
        rawImage = rawImage - lowerEnd;
        normalizingValue = lowerEnd;

    else
    % if minimum value is cero or positive:
        % get maximum value
        upperEnd = max(max(rawImage));
        normalizingValue = upperEnd;

    end
    % then

    rawImage = rawImage ./ normalizingValue; % divide everything by it
    rawImage = rawImage - 0.5; % substract 0.5 from all matrix values
    rawImage = rawImage .* 512; % multiply all matrix values by 512

    normalizedImage = round(rawImage); % round all matrix values to force integers
end