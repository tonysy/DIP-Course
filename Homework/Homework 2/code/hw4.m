clear;clc;

load('Image4.mat');
figure;

% Original Blurred Image
subplot(3,2,1);
imshow(test4);
title('Original Blurred Image');

% Median Filtered Image
subplot(3,2,3);
kernel_1 = [0 1 0;1 -4 1;0 1 0];
imshow(uint8(LaplaceSharpen(test4, kernel_1))+test4,[]);
title('Sharpening(Kernel1) Image');

subplot(3,2,4);
kernel_2 = [1 1 1;1 -8 1;1 1 1];
imshow(uint8(LaplaceSharpen(test4, kernel_2))+test4,[]);
title('Sharpening(Kernel2) Image');

subplot(3,2,5);
kernel_3 = [0 -1 0;-1 4 -1;0 -1 0];
imshow(uint8(LaplaceSharpen(test4, kernel_3))+test4,[]);
title('Sharpening(Kernel3) Image');

subplot(3,2,6);
kernel_4 = [-1 -1 -1;-1 8 -1;-1 -1 -1];
imshow(uint8(LaplaceSharpen(test4, kernel_4))+test4,[]);
% imshow(uint8(conv2(test4, kernel_4,'same')),[])
title('Sharpening(Kernel4) Image');