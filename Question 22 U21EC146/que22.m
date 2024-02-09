% Read the image
originalImage = imread('tiger.jpg'); % Replace 'tiger.jpg' with the actual image file name.

% Convert the image to grayscale
grayImage = rgb2gray(originalImage);

% Apply edge detection (you can use other edge detection methods as well)
edgeImage = edge(grayImage, 'Canny');

% Perform Hough transform to detect lines
[H, theta, rho] = hough(edgeImage);

% Find peaks in the Hough transform
peaks = houghpeaks(H, 5); % You can adjust the number of peaks based on your image

% Extract lines using Hough transform parameters and peaks
lines = houghlines(edgeImage, theta, rho, peaks);

% Display the original image
figure;
imshow(originalImage);
title('Original Image');

% Plot the detected lines on the original image
hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:, 1), xy(:, 2), 'LineWidth', 2, 'Color', 'r');
end
hold off;
title('Image with Detected Lines');

% Filter lines based on the right edge (adjust as needed)
filteredLines = lines(arrayfun(@(line) line.point1(1) > size(originalImage, 2)/2, lines));

% Display the original image with only the right edge lines
figure;
imshow(originalImage);
title('Original Image with Right Edge Lines');

hold on;
for k = 1:length(filteredLines)
    xy = [filteredLines(k).point1; filteredLines(k).point2];
    plot(xy(:, 1), xy(:, 2), 'LineWidth', 2, 'Color', 'r');
end
hold off;
title('Image with Detected Right Edge Lines');
 