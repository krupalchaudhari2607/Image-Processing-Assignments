clc;
clear all;
close all;

    a = [1, 2, 3; 4, 5, 6; 7, 8, 9];
    b = [1, 1; 1, 1; 1, 1];

    [m, n] = size(a);
    [p, q] = size(b);

    % Pad the input matrix to handle border effects
    paddedMatrix1 = padarray(a, [p-1, q-1], 'both');

    % Initialize the result matrix
    result = zeros(m + p - 1, n + q - 1);

    % Perform 2D convolution
    for i = 1:m + p - 1
        for j = 1:n + q - 1
            result(i, j) = sum(sum(paddedMatrix1(i:i+p-1, j:j+q-1) .* b));
        end
    end
    
    disp(result)
    c=conv2(a,b)
    %disp(c);