%program for Pseudo-Inverse Filterirng
clc
 close all;
 clear all;

 %Reading the input image
 A=imread('myna.jpg');
 A=double(rgb2gray(A));
 [M,N]=size(A);

 %Degraded Mask
 mask_b=ones(11,11)/121;
 [m1,n1]=size(mask_b);

 %Transformation is Frequency Domain
 freq_a=fft2(A);
 freq_h=fft2(mask_b,M,N);

 %Blurred Image
 blurr_img=real(ifft2(freq_h.*freq_a))+25*randn(M,N);
 in_aspec=fft2(blurr_img);

 psf=zeros(M,N);
 psf(M/2+1-(m1-1)/2:M/2+1+(m1-1)/2,N/2+1-(n1-1)/2:N/2+1+(n1-1)/2)=mask_b;
 psf=fftshift(psf);
 freq_res=fft2(psf);
 Thr_Freq=0.2;
 Inv_filt=freq_res./((abs(freq_res)).^2+Thr_Freq);
 B=real(ifft2(in_aspec.*Inv_filt));
 
%Display of Input and Output Image
imshow(uint8(A)),title('Original Image')
figure, imshow(uint8(blurr_img)),title('Degraded Image')
figure, imshow(uint8(B)), title('Restored Image after Pseudo-inverse filtering')





