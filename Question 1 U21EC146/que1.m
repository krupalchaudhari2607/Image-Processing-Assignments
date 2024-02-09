% Generate a test image
originalImage = uint8(255 * rand(1024));

% Display the original image
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');
xlabel('Spatial Resolution: 1024x1024');
ylabel('Intensity Resolution: 8-bit');

% Reduce spatial resolution
reducedSpatialResolution = imresize(originalImage, [256, 256]);
subplot(2, 2, 2);
imshow(reducedSpatialResolution);
title('Reduced Spatial Resolution');
xlabel('Spatial Resolution: 256x256');
ylabel('Intensity Resolution: 8-bit');

% Reduce intensity resolution
reducedIntensityResolution = imresize(originalImage, [1024, 1024]);
reducedIntensityResolution = im2uint8(mat2gray(reducedIntensityResolution, [0, 255]));
subplot(2, 2, 3);
imshow(reducedIntensityResolution);
title('Reduced Intensity Resolution');
xlabel('Spatial Resolution: 1024x1024');
ylabel('Intensity Resolution: 4-bit');

% Reduce both spatial and intensity resolution
reducedBothResolution = imresize(originalImage, [256, 256]);
reducedBothResolution = im2uint8(mat2gray(reducedBothResolution, [0, 255]));
subplot(2, 2, 4);
imshow(reducedBothResolution);
title('Reduced Both Spatial and Intensity Resolution');
xlabel('Spatial Resolution: 256x256');
ylabel('Intensity Resolution: 4-bit');

% Comment on the obtained result
fprintf('The reduced spatial resolution image may lose fine details.\n');
fprintf('The reduced intensity resolution image may lose color nuances and fine intensity variations.\n');
fprintf('Reducing both spatial and intensity resolution may result in significant loss of information.\n');
