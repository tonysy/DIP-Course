clear;clc;

% --- load image -----
load('I_logo.mat');
load('I_org.mat');

figure;
subplot(1,3,1);
imshow(I,[]);
title('Original Image');

subplot(1,3,2);
imshow(I_logo,[]);
title('With Watermark Image');

% --- Extract Watermark ----
masked_dct = dct2(I_logo);
ori_dct = dct2(I);

% --- DCT transformation ----
masked_dct = masked_dct';
masked_dct = masked_dct(:);
ori_dct = ori_dct';
ori_dct = ori_dct(:);

% --- Calculate Frequency Gap ---
[sorted_ori_dct, index_ori] = sort(abs(ori_dct), 'descend');
H=106;W=312;
water_mask_freq = masked_dct(index_ori(1:H*W)) - ori_dct(index_ori(1:H*W));

water_mask_freq = reshape(water_mask_freq,[W,H])';
water_mask_freq = water_mask_freq*100;
water_mask_image = idct2(water_mask_freq);

% Plot
subplot(1,3,3);
imshow(uint8(water_mask_image),[]);
title('Watermark');


        