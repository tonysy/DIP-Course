% Problem-3: Periodic Noise Reduction Using a Notch Filter
close all;clear all;clc;

figure;
colormap(gray(256));
load('Test3.mat');

img = double(f);
im_size = size(img);

% Figure-1
noise = sin_noise(20, im_size);
noised_img = uint8(noise + img);
spectrum_img = abs(fftshift(fft2(noised_img)));
spectrum_img = log(1+spectrum_img);

% spectrum_im2 = abs(fftshift(fft2(noise)));
% spectrum_im2 = log(1+spectrum_im2);
noise2 =  notch_filter(noised_img);
G = fftshift(noise2);
g = real(ifft2(G));
noise2 = log(1+abs(noise2));

subplot(2,2,1);
imshow(f,[]);
title('Original Image');

% Figure-2
subplot(2,2,2);
imshow(noised_img,[]);
title('Sinusoidal Noised Image');

% Figure-3
subplot(2,2,3);
imshow(spectrum_img,[]);
title('Spectrum image');

% Figure-4
subplot(2,2,4);
imshow(g,[]);
title('Notch Filtered Image');
