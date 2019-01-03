clc;close all;clear;

data = load("Test3.mat");
image = data.f;
imshow(image);


%% Sub-Problem-1: Ostu
[cnts, locs] =imhist(image);
pi = double(cnts)/sum(cnts);


%%% Calculate cumulative sums
cum_p = cumsum(pi); 
%%% Compute the cumulative means
means = cumsum((1:length(pi))' .* pi);
%%% Calculate global intensity mean
means_g = means(length(means));
sigma = (means_g*cum_p - means).^2 ./ (cum_p.*(1-cum_p));
[val, k] = max(sigma);
mask = image>=k;

%% Ploat Image
figure;
imshow(mask);
title('Threshold with Otsu');

%% Sub-Problem-2: Region Growing
figure;
imshow(RegionGrow(image, mask));
title('Two largest rings');
