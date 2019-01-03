data = load("Test2.mat");
img = data.f;

% Global Thresholding
threshold=100;
threshold=GlobalThresh(img, threshold);

mask = img>=threshold;

% Plot the image
figure;
subplot(121);
imshow(img);
title('Original Image');

subplot(122);
imshow(mask);
title('Figerprint after Gloabl Thresholding');


