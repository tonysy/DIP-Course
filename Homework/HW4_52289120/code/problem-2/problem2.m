% Problem-2 Noise Reduction Using a Median Filter

close all;clear all;clc;

figure;
colormap(gray(256));
load('Test2.mat');

% Figure-1
noised_img = imnoise(f,'salt & pepper', 0.2);
subplot(2,2,1);
imshow(noised_img,[]);
title('Noise Image');

% Figure-2
subplot(2,2,2);
img2 = medfilt2(noised_img, [5,5]);
imshow(img2, []);
title('Median Filtered Once');

% Figure-3
subplot(2,2,3);
img3 = medfilt2(img2, [5,5]);
imshow(img3, []);
title('Median Filtered Twice');

% Figure-4
subplot(2,2,4);
img4 = adaptive_med_filter(noised_img, 5);
imshow(img4, []);
title('Adaptive Median Filtered');
