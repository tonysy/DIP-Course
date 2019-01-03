% Problem-4: Parametric Wiener Filter
clear all;close all;clc;


% Create Figure
figure;grid off;
colormap(gray(256));
load('Test3.mat');
img = double(f);
im_size = size(img);

% Figure 1
[blurred_img, H] = motion_blur(img,1,0.1,0.1);
% subplot(2,2,1);
% image(repmat(f, [1,1,3]));
% title('original image');
% Motion Blurred
subplot(2,2,1);
imshow(blurred_img,[]);
title('Motion Blurred Image');

% Figure 2
% + Gaussian Noise
gaussian_noise = normrnd(0, sqrt(10), im_size);
image_gaussain = blurred_img + double(gaussian_noise);
subplot(2,2,2);
imshow(image_gaussain,[]);
title('Guassian Noise + Motion Blurred Image');

% Figure 3
K=0.005;
restored_img = wiener_filter(image_gaussain, H, K);
subplot(2,2,3);
imshow(restored_img,[]);
title('Restored Image(K=0.005)');