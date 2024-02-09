function compare_filters(image_path)
    % Read the image
    original_image = imread("test.png");

    % Display the original image
    figure;
    subplot(2, 2, 1);
    imshow(original_image);
    title('Original Image');

    % Apply the adaptive filter
    adaptive_filtered_image = adaptive_local_filter(original_image, 3, 20);
    subplot(2, 2, 2);
    imshow(adaptive_filtered_image);
    title('Adaptive Local Filter');

    % Apply the arithmetic mean filter
    arithmetic_filtered_image = imfilter(original_image, fspecial('average', [3 3]));
    subplot(2, 2, 3);
    imshow(arithmetic_filtered_image);
    title('Arithmetic Mean Filter');

    % Apply the geometric mean filter
    geometric_filtered_image = geomeanfilter(original_image, [3 3]);
    subplot(2, 2, 4);
    imshow(geometric_filtered_image);
    title('Geometric Mean Filter');
end

function output_image = adaptive_local_filter(input_image, window_size, threshold)
    input_image = double(input_image);
    [m, n] = size(input_image);
    output_image = zeros(m, n);

    for i = 1:m
        for j = 1:n
            row_start = max(1, i - floor(window_size/2));
            row_end = min(m, i + floor(window_size/2));
            col_start = max(1, j - floor(window_size/2));
            col_end = min(n, j + floor(window_size/2));

            local_window = input_image(row_start:row_end, col_start:col_end);

            local_mean = mean(local_window(:));
            local_std = std(local_window(:));

            if local_std > threshold
                output_image(i, j) = input_image(i, j);
            else
                output_image(i, j) = local_mean;
            end
        end
    end

    output_image = uint8(output_image);
end

function output_image = geomeanfilter(input_image, window_size)
    input_image = double(input_image);
    [m, n] = size(input_image);
    output_image = zeros(m, n);

    for i = 1:m
        for j = 1:n
            row_start = max(1, i - floor(window_size(1)/2));
            row_end = min(m, i + floor(window_size(1)/2));
            col_start = max(1, j - floor(window_size(2)/2));
            col_end = min(n, j + floor(window_size(2)/2));

            local_window = input_image(row_start:row_end, col_start:col_end);

            output_image(i, j) = exp(mean(log(local_window(:))));
        end
    end

    output_image = uint8(output_image);
end