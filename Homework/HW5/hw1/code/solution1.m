clc;close all;
data = load("Test1.mat");
img = data.f;

% Step1: Smooth image
threshold = 60;
kernel = fspecial('gaussian', 3);
smoothed_img = conv2(double(img), kernel, 'valid');

% Step2: Compute the Gradient of image with sobel kernel
[gradiednt, mask] = DetectEdge(smoothed_img, threshold);


% Plot the image
figure;

subplot(121);
imshow(img);
title('Raw Image');

subplot(122);
imshow(mask);
title('Edge Results @T=60');