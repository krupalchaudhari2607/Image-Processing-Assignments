% Define image size
imageSize = [256, 256];

% Create a grid of coordinates
[x, ~] = meshgrid(1:imageSize(2), 1:imageSize(1));  % Adjusted for vertical direction

% Define frequencies
frequencies = [1, 10, 20];

% Generate sinusoidal waves
sinusoidalWaves = zeros([imageSize, numel(frequencies)]);

for idx = 1:numel(frequencies)
    sinusoidalWaves(:,:,idx) = sin(2 * pi * frequencies(idx) * x / imageSize(2));  % Adjusted for vertical direction
end

% Display the generated waves
figure;
for idx = 1:numel(frequencies)
    subplot(1, numel(frequencies), idx), imshow(sinusoidalWaves(:,:,idx), []), title(['Frequency ', num2str(frequencies(idx))]);
end