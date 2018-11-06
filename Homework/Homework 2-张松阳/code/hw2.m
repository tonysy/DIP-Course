clc;clear;
% Problem-2

% Figure-2
figure;

% Task-1: My Histogram of image21
subplot(1,2,1);
load('Image21.mat');

[hist_value, hist_value_prob] = Histogram(test21);
x_axis = 0:1:255;
bar(x_axis, hist_value);
title('My Histogram Of Image21');

% Task-2: imhist Histogram of image21
subplot(1,2,2);
imhist(test21);
title('Built-In Histogram Of Image21');

pause;
% Figure-3
figure;
% Task-1: Plot Image21
subplot(3,2,1);
image(test21);
colormap(gray(256));
axis image;
axis off;
title('Original Image21');

% Task-2: Histgram of Image21
subplot(3,2,2);
imhist(test21);
title('Original Image21 Histogram');

% Task-3: Plot Image22
load('Image22.mat');
subplot(3,2,3);
image(test22);
colormap(gray(256));
axis image;
axis off;
title('Reference Image22');


% Task-4: Histgram of Image22
subplot(3,2,4);
imhist(test22);
title('Reference Image21 Histogram');


subplot(3,2,5);
mapping = HistogramMatch(test21, test22);
image_match = mapping(double(test21)+1);
imshow(image_match,[]);
title('Matched Image21');

subplot(3,2,6);
imhist(uint8(image_match));
title('Matched Image21 Histogram');

% pause;
% % Figure-4
% subplot(2,2,1);
% image(test21);
% colormap(gray(256));
% axis image;
% axis off;
% 
% subplot(2,2,2);
% imhist(test21);
% 
% subplot(2,2,3)
% test21_equa = HistogramEqua(test21);
% image(test21_equa)
% colormap(gray(256));
% axis image;
% axis off;
% 
% 
% subplot(2,2,4);
% imhist(test21_equa);

