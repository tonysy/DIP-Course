% Problem-1: Noise Generators
close all;clear all;clc;

figure;

load('Test1.mat')
colormap(gray(256));
img = f;

% Figure-1
subplot(2,2,1);
imshow(img,[]);
title('Original Image');

% Figure-2
subplot(2,2,2)
imhist(uint8(img));
axis([0,255, 0,500000])
title('Histogram of Original Image');

% Figure-3
noise_img = gauss_noise(50, 25, 1024);
image_noised = double(img) + double(noise_img);
subplot(2,2,3);
imshow(uint8(image_noised));
title('Gaussian Noise Image');

% Figure-4
subplot(2,2,4);
image_noised = uint8(image_noised);
imhist(image_noised);
axis([0, 255, 0, 50000]);
title('Image Histogram');

% New Figure
figure;
subplot(2,2,1);
imshow(img, []);
title('Original Image');

subplot(2,2,2)
imhist(uint8(img));
axis([0,255, 0,500000])
title('Original Image Histogram');

subplot(2,2,3);
saltPepperImg = salt_pepper(img, 0, 255, 0.1, 0.1, 1024);
imshow(saltPepperImg,[]);
title('Salt Pepper Image');

subplot(2,2,4);
imhist(uint8(saltPepperImg));
axis([0,255, 0, 250000])
title('Salt Pepper histogram');

