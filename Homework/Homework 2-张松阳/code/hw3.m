clear;clc;

load('Image3.mat');
figure;

% Original Blurred Image
subplot(2,2,1);
imshow(test3);
title('Original Blurred Image');

% Average Filtered Image
subplot(2,2,2);
template_a = 1/9*[1 1 1;1 1 1;1 1 1];
imshow(conv2(test3, template_a, 'same'),[]);
title('Average(Kernel1) Filtered Image');

% Average Filtered Image
subplot(2,2,3);
template_b = 1/16*[1 2 1;2 4 2;1 2 1];
imshow(conv2(test3, template_b, 'same'),[]);
title('Average(Kernel2) Filtered Image');

% Median Filtered Image
subplot(2,2,4);
% imshow(medfilt2(test3),[]);
imshow(MedianFilter(test3, 'same'));
title('Median Filtered Image');
