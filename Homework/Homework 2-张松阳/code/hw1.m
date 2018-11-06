clear;clc;
% Create Figure to plot
figure;

% Step-1: Plot Transform Function
x = 0:1:255;
y = [];
for i=0:1:255
    y = [y PieceLinear(i, 96, 32, 160, 216)];
end
subplot(2,2,1);
plot(x, y);
title('Tranformation Function');
xlabel('Input Instensity level, r');
ylabel('Output Instensity level, s');
grid on;

% Step-2: Plot Low-Contrast Image
subplot(2,2,2);
load('Image1.mat');
image(test1);
colormap(gray(256));
axis image;
axis off;
title('Low Contrast Image');

% Step-3: Plot Piece-Wise Linear Transformation
image_1 = test1;
w = size(image_1, 1);
h = size(image_1, 2);
r1 = 96;
s1 = 32;
r2 = 160;
s2 = 216;

for i = 1 : w
    for j = 1 : h
        image_1(i, j)=PieceLinear(image_1(i,j), r1, s1, r2, s2);
    end
end
subplot(2,2,3);
image(image_1);
colormap(gray(256));
axis image;
axis off;
title('Stretching Image');


% Step-4: Plot Piece-Wise Linear Transformation
image_2 = test1;
w = size(image_2, 1);
h = size(image_2, 2);
r1 = 120;
s1 = 120;
r2 = 0;
s2 = 255;

for i = 1 : w
    for j = 1 : h
        image_2(i, j)=PieceLinear(image_2(i,j), r1, s1, r2, s2);
    end
end
subplot(2,2,4);
image(image_2);
colormap(gray(256));
axis image;
axis off;
title('Binary Image');

