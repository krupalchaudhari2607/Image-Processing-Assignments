clc;
clear all;
close all;

% Load the image
originalImage = imread('image.png');


% Add Gaussian noise
noisyImage = imnoise(originalImage, 'gaussian', 0, 0.01);

% Display the original and noisy images
subplot(131), imshow(originalImage), title('Original Image');
subplot(132), imshow(noisyImage), title('Noisy Image');

% Apply low-pass filters of different sizes
filterSizes = [3, 5, 7, 9];

for i = 1:length(filterSizes)
    filterSize = filterSizes(i);
    filter = ones(filterSize) / (filterSize^2);
    filteredImage = imfilter(noisyImage, filter, 'conv');
    
    % Display the filtered image
    subplot(1, 3, 3), imshow(filteredImage), title(['Filtered Image (size=', num2str(filterSize), ')']);
    pause(1); % Pause for a moment to observe each result
end

% Apply weighted average filter
weightedFilter = [1, 2, 1; 2, 4, 2; 1, 2, 1] / 16;
weightedImage = imfilter(noisyImage, weightedFilter, 'conv');

% Display the weighted average filtered image
subplot(121), imshow(noisyImage), title('Noisy Image');
subplot(122), imshow(weightedImage), title('Weighted Average Filtered Image');

% While both average and weighted average filter remove noise, there is
% less blurring in weighted avg filter.