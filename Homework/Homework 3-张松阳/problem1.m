clc;
clear all;
close all;
% load data
load('Test1.mat');

figure;

% resize with pixel deletion
subplot(2,2,1);
out1 = duplication(f, -4);
imshow(out1, []);
title('Resize with pixel deletion');

% averaging filtering and resize
subplot(2,2,2);
coef = 1/9;
kernel = [1 1 1;1 1 1;1 1 1];
out2 = conv2(f, kernel*coef, 'same');
imshow(out2, []);
title('Resize with averaging filtering');

% zoom with image duplication
subplot(2,2,3);
out3 = duplication(f, 4);
imshow(out3, []);
title('Zoom with pixel duplication');

% zoom with bilinear interpolation
subplot(2,2,4);
out4 = imresize(f,4, 'bilinear');
imshow(out4, []);
title('Zoom with bilinear interpolation');
