clc;
clear all;
close all;
%Reading Input Image
A=imread('peacock.jpg');
A=double(rgb2gray(A));
[M,N]=size(A);

%Degradation function
h=ones(11,11)/121;

freq_a=fft2(A);
freq_h=fft2(h,M,N);

%image degradation in freq domain

deg_a=freq_h.*freq_a;

%degraded image in spatial domain
B=real(ifft2(deg_a));

%Inverse filtering for image Restoration
 freq_b=fft2(B);
 powfreq_a= freq_a.^2/(M*N);
 alpha=0.5;
 sigma=sqrt(4*10^(-7));
 freq_g=((freq_h.')').*abs(powfreq_a)...
     ./(abs(freq_h.^2).*abs(powfreq_a)+alpha*sigma^2);
 Res_freq_a=freq_g.*freq_b;

 %Rerstored Image in Spatial Domain
 Res_a=real(ifft2(Res_freq_a));

 %Display input and output image
 imshow(uint8(A)),title('Original Image');
 figure, imshow(uint8(B)),title('Degrated Image');
 figure, imshow(uint8(Res_a)), title('Restored Image After Inverse filtering');


