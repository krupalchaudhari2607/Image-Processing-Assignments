clc
close all
clear all
img=im2double(imread('file:///MATLAB Drive/image nature - Yahoo India Image Search results_files/th(6)'));   %read image
subplot(2,2,1)
imshow(img)
title('original image')

no_img= im2double(rgb2gray(imnoise(img,'salt & pepper')));  %convert image into black and white and also introduce salt and pepper noise
subplot(2,2,2)
imshow(no_img)
title('noisy gray image')
[r,c]=size(no_img);

% 3x3 mask
padedimg=zeros(433,602);
padedimg(2:r+1,2:c+1)=no_img;

mask=[1 1 1;1 1 1;1 1 1];
for i=2:r
    for j=2:c
        outimg(i-1,j-1)=mask(1,1)*padedimg(i-1,j-1)+mask(1,2)*padedimg(i-1,j)+mask(1,3)*padedimg(i-1,j+1)+mask(2,1)*padedimg(i,j-1)+ mask(2,2)*padedimg(i,j)+mask(2,3)*padedimg(i,j+1)+mask(3,1)*padedimg(i+1,j-1)+mask(3,2)*padedimg(i+1,j)+mask(3,3)*padedimg(i+1,j+1);
    end
end
    d=3;
subplot(2,2,3)
o=outimg/(9-d);
imshow(o)
title('after applying alpha-trimmed mean filter')