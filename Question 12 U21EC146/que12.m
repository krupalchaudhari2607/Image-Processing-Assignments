clc 
clear all
close all

% Read an image
originalImage = imread('cameraman.jpg');

% Define a filter (kernel)
filter = fspecial('gaussian', [5 5], 2); % Example Gaussian filter

% Perform convolution in the spatial domain
convolutionResult = conv2(double(originalImage), double(filter), 'same');

% Compute the Fourier transforms of the original image and the filter
fftOriginal = fft2(double(originalImage));
fftFilter = fft2(double(filter), size(originalImage, 1), size(originalImage, 2));

% Multiply the Fourier transforms in the frequency domain
multiplicationResult = ifft2(fftOriginal .* fftFilter);

% Display the results
figure;
subplot(2, 2, 1), imshow(originalImage, []), title('Original Image');
subplot(2, 2, 2), imshow(filter, []), title('Filter');
subplot(2, 2, 3), imshow(convolutionResult, []), title('Convolution Result');
subplot(2, 2, 4), imshow(multiplicationResult, []), title('Multiplication Result');