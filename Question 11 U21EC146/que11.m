clc;
clear all;
close all;
% Read two images
image1 = imread('tiger.jpg'); % Replace 'tiger.jpg' with the filename of your first image
image2 = imread('zebra.jpg'); % Replace 'zebra.jpg' with the filename of your second image

% Convert images to grayscale if they are RGB
if size(image1, 3) == 3
    image1 = rgb2gray(image1);
end
if size(image2, 3) == 3
    image2 = rgb2gray(image2);
end

% Check image dimensions and resize if needed
if numel(image1) > numel(image2)
    image2 = imresize(image2, size(image1));
else
    image1 = imresize(image1, size(image2));
end

% Perform Fourier Transform on the images
fft_image1 = fft2(double(image1));
fft_image2 = fft2(double(image2));

% Get magnitude and phase information
magnitude_image1 = abs(fft_image1);
phase_image1 = angle(fft_image1);

magnitude_image2 = abs(fft_image2);
phase_image2 = angle(fft_image2);

% Interchange magnitude and phase information
reconstructed_image1 = ifft2(magnitude_image2 .* exp(1i * phase_image1));
reconstructed_image2 = ifft2(magnitude_image1 .* exp(1i * phase_image2));

% Display original and reconstructed images
figure;
subplot(2, 2, 1);
imshow(image1);
title('Original Image 1');

subplot(2, 2, 2);
imshow(uint8(abs(reconstructed_image1)));
title('Reconstructed Image 1 (Magnitude from Image 2, Phase from Image 1)');

subplot(2, 2, 3);
imshow(image2);
title('Original Image 2');

subplot(2, 2, 4);
imshow(uint8(abs(reconstructed_image2)));
title('Reconstructed Image 2 (Magnitude from Image 1, Phase from Image 2)');
