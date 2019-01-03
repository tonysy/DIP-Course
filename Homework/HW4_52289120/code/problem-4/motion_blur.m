function [blurred_im, H] = motion_blur(im,T,a,b)
%MOTION_BLUR Summary of this function goes here
%   Detailed explanation goes here
F = fftshift(fft2(im));
im_size = size(im);
u = 1:im_size(1);
v = 1:im_size(2);
[V, U] = meshgrid(u,v);
Z = (U-im_size(1)/2) * a + (V-im_size(2)/2) * b + 0.001;
H = (T./(pi * Z)).*(sin(pi * Z).*(exp(-i*pi*Z)));
blurred_im = real(ifft2(ifftshift(F.*H)));
end

