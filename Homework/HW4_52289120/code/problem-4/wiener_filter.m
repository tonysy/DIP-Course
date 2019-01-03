function [output_im] = wiener_filter(im, H, K)
%WIENER_FILTER Summary of this function goes here
%  
im = double(im);
F = fftshift(fft2(im));
W = conj(H)./(abs(H).^2+K);
output_im = real(ifft2(ifftshift(W.*F)));
end

