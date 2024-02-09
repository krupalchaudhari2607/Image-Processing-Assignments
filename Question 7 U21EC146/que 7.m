clc
clear all;
close all;
%black and white image
I = imread('moon.png');
J = imnoise(I,'salt & pepper',0.02);
L = padarray(J,[3,3],'symmetric');
K = medfilt2(L,'symmetric');
imshow(K)

%color RGB image
img = imread('lotus.jpg');
figure; imshow(img)
% add some noise
M = imnoise(img, 'salt & pepper', 0.02);
figure; imshow(M);
L = padarray(M,[3,3],'symmetric');
figure; imshow(L);
% apply medfilt2 on each color
Fil = L;
for c = 1 : 3
    Fil(:, :, c) = medfilt2(L(:, :, c), [3, 3],'symmetric');
end
figure; imshow(Fil);