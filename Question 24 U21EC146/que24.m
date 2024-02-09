% Read a binary image (replace 'binary_image.png' with your image file)
binary_image = imread('morph_dilate.png');
binary_image = im2bw(binary_image);

% Display the original binary image
figure;
subplot(2, 3, 1);
imshow(binary_image);
title('Original Binary Image');

% Perform Erosion
se = strel('square', 3); % Structuring element (3x3 square)
eroded_image = imerode(binary_image, se);

subplot(2, 3, 2);
imshow(eroded_image);
title('Erosion');

% Perform Dilation
dilated_image = imdilate(binary_image, se);

subplot(2, 3, 3);
imshow(dilated_image);
title('Dilation');

% Perform Opening (Erosion followed by Dilation)
opened_image = imopen(binary_image, se);

subplot(2, 3, 4);
imshow(opened_image);
title('Opening');

% Perform Closing (Dilation followed by Erosion)
closed_image = imclose(binary_image, se);

subplot(2, 3, 5);
imshow(closed_image);
title('Closing');

% Perform Boundary Extension
boundary_extended_image = imdilate(binary_image, strel('square', 3)) - binary_image;

subplot(2, 3, 6);
imshow(boundary_extended_image);
title('Boundary Extension');

% Region Filling
filled_image = imfill(binary_image, 'holes');

% Display the filled image separately
figure;
imshow(filled_image);
title('Region Filling');
24