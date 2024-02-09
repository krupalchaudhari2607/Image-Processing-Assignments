clc;
close all;
clear all;

% Read an image
originalImage = imread('Sunflower.jpg');

% Convert the image to grayscale
grayImage = rgb2gray(originalImage);

% Apply Prewitt edge detection
edges = edge(grayImage, 'Prewitt');

% Display the original and Prewitt edge-detected images
subplot(2, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(2, 2, 2);
imshow(edges);
title('Prewitt Edge Detection');


% Create Roberts masks
robertsMaskX = [1 0; 0 -1];
robertsMaskY = [0 1; -1 0];

% Apply Roberts edge detection using conv2
edgesX = conv2(double(grayImage), robertsMaskX, 'same');
edgesY = conv2(double(grayImage), robertsMaskY, 'same');

% Combine the X and Y edge maps
edges = sqrt(edgesX.^2 + edgesY.^2);

% Normalize the result to the range [0, 255]
edges = uint8(edges / max(edges(:)) * 255);

% Display the original and Roberts edge-detected images
subplot(2, 2, 3);
imshow(edges);
title('Roberts Edge Detection');

% Create Robinson masks
robinsonMask1 = [1 2 1; 0 0 0; -1 -2 -1];
robinsonMask2 = [2 1 0; 1 0 -1; 0 -1 -2];
robinsonMask3 = [1 0 -1; 2 0 -2; 1 0 -1];
robinsonMask4 = [0 -1 -2; 1 0 -1; 2 1 0];

% Apply Robinson edge detection using conv2
edges1 = conv2(double(grayImage), robinsonMask1, 'same');
edges2 = conv2(double(grayImage), robinsonMask2, 'same');
edges3 = conv2(double(grayImage), robinsonMask3, 'same');
edges4 = conv2(double(grayImage), robinsonMask4, 'same');

% Combine the edge maps
edges = sqrt(edges1.^2 + edges2.^2 + edges3.^2 + edges4.^2);

% Normalize the result to the range [0, 255]
edges = uint8(edges / max(edges(:)) * 255);

% Display the original and Robinson edge-detected images
subplot(2, 2, 4);
imshow(edges);
title('Robinson Edge Detection');


% Apply Sobel edge detection
edges = edge(grayImage, 'Sobel');

% Display the original and Sobel edge-detected images
figure;
subplot(2, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(2, 2, 2);
imshow(edges);
title('Sobel Edge Detection');

% Define a custom edge detection kernel
selfEdgeKernel = [-1, -1, -1; -1, 8, -1; -1, -1, -1];

% Apply custom edge detection using conv2
edges = conv2(double(grayImage), selfEdgeKernel, 'same');

% Normalize the result to the range [0, 255]
edges = uint8(edges / max(edges(:)) * 255);

% Display the original and custom edge-detected images
subplot(2, 2, 3);
imshow(edges);
title('Custom Edge Detection');

% Define the Kirsch operator masks
masks = [3, 3, 3; 3, 0, 3; -5, -5, -5];

% Pad the image with zeros
paddedImage = padarray(grayImage, [1, 1]);

% Create an output image of the same size as the input image
outputImage = zeros(size(grayImage));

% Apply the Kirsch operator
for i = 2:size(paddedImage, 1)-1
    for j = 2:size(paddedImage, 2)-1
        % Apply the Kirsch operator masks
        neighbors = double(paddedImage(i-1:i+1, j-1:j+1));
        gradient = abs(sum(sum(neighbors .* masks)));
        
        % Set the pixel value in the output image
        outputImage(i-1, j-1) = gradient;
    end
end

% Display the input and output images

subplot(2, 2, 4);
imshow(uint8(outputImage));
title('Kirsch Edge Detection');


