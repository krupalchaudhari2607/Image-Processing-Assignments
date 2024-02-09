clc;
clear all;
close all;
I=imread('file:///MATLAB Drive/image nature - Yahoo India Image Search results_files/th(8)');
I=rgb2gray(I);
Kr=24; %row of kernel
Kc=24; %column of kernel
w=ones(Kr,Kc)/(Kr*Kc);  %represent each element of kernel of filter
F=imfilter(I,w,'replicate','same'); %replicate used to avoid zero padding at boundry
                                %same used to equalize the size of origina image and filtered image



subplot(1,2,1)
imshow(I)
title('Original image')

 subplot(1,2,2)
imshow(F)
title('Filtered image')