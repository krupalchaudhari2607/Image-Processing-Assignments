% Read the image
original_image = imread('tiger.jpg'); % Replace 'your_image.jpg' with your image file

% Convert the image to grayscale if it is an RGB image
if size(original_image, 3) == 3
    original_image = rgb2gray(original_image);
end

% Display the original image
figure;
subplot(1, 3, 1);
imshow(original_image);
title('Original Image');

% Degrade the image by adding AWGN
SNR_AWGN = 40; % Signal-to-Noise Ratio for AWGN
degraded_image_AWGN = imnoise(original_image, 'gaussian', 0, (1/(10^(SNR_AWGN/20))));

% Display the degraded image with AWGN
subplot(1, 3, 2);
imshow(degraded_image_AWGN);
title('Degraded Image with AWGN');

% Degrade the image by adding simple Gaussian noise
sigma_simple_gaussian = 50; % Standard deviation for simple Gaussian noise
degraded_image_simple_gaussian = imnoise(original_image, 'gaussian', 0, (sigma_simple_gaussian/255));

% Display the degraded image with simple Gaussian noise
subplot(1, 3, 3);
imshow(degraded_image_simple_gaussian);
title('Degraded Image with Simple Gaussian Noise');

% Apply Wiener filter to restore the grayscale image degraded with AWGN
restored_image_AWGN = wiener2(degraded_image_AWGN, [5, 5]);

% Display the restored image with Wiener filter (AWGN)
figure;
subplot(1, 2, 1);
imshow(restored_image_AWGN);
title('Restored Image with Wiener Filter (AWGN)');

% Apply Wiener filter to restore the grayscale image degraded with simple Gaussian noise
restored_image_simple_gaussian = wiener2(degraded_image_simple_gaussian, [5, 5]);

% Display the restored image with Wiener filter (simple Gaussian noise)
subplot(1, 2, 2);
imshow(restored_image_simple_gaussian);
title('Restored Image with Wiener Filter (Simple Gaussian Noise)');
