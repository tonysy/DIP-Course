% this is a sample code to display an image in gray level;
load('Image1.mat');
figure;
image(test1);
colormap(gray(256));
axis image;
axis off