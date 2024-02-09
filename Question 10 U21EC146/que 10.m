% Define the horizontal frequencies
frequencies = [1, 10, 20];

% Create a grid of points
[x, y] = meshgrid(-100:0.1:100, -100:0.1:100);

% Generate the original signal with horizontal frequencies
original_signal = zeros(size(x));
for freq = frequencies
    original_signal = original_signal + sin(2 * pi * freq * x / 100);
end

% Display the original signal
figure;
subplot(2, 2, 1);
imshow(original_signal, []);
title('Original Signal');
xlabel('Horizontal Direction');
ylabel('Vertical Direction');

% Rotate the signal by 45 degrees
rotated_signal = imrotate(original_signal, 45, 'crop');

% Display the rotated signal
subplot(2, 2, 2);
imshow(rotated_signal, []);
title('Rotated Signal (45 degrees)');
xlabel('Horizontal Direction');
ylabel('Vertical Direction');

% Compute and display the frequency spectrum of the original signal
subplot(2, 2, 3);
original_spectrum = fftshift(fft2(original_signal));
imshow(log(abs(original_spectrum) + 1), []);
title('Frequency Spectrum (Original Signal)');
xlabel('Horizontal Frequency');
ylabel('Vertical Frequency');

% Compute and display the frequency spectrum of the rotated signal
subplot(2, 2, 4);
rotated_spectrum = fftshift(fft2(rotated_signal));
imshow(log(abs(rotated_spectrum) + 1), []);
title('Frequency Spectrum (Rotated Signal)');
xlabel('Horizontal Frequency');
ylabel('Vertical Frequency');