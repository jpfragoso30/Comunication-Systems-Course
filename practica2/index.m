original = imread('cameraman.tif');
[compressedWith10] = compimag('cameraman', 'tif', 10);
[compressedWith25] = compimag('cameraman', 'tif', 25);
[compressedWith50] = compimag('cameraman', 'tif', 50);
[compressedWith75] = compimag('cameraman', 'tif', 75);

figure('Name', 'Original', 'NumberTitle', 'off');

imshow(original)
title('Original - 0')

figure('Name', 'Thresholds', 'NumberTitle', 'off');

subplot(2, 2, 1)
imshow(compressedWith10)
title('Threshold - 10')

subplot(2, 2, 2)
imshow(compressedWith25)
title('Threshold - 25')

subplot(2, 2, 3)
imshow(compressedWith50)
title('Threshold - 50')

subplot(2, 2, 4)
imshow(compressedWith75)
title('Threshold - 75')