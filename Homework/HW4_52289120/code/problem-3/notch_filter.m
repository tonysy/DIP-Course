function [filtered_image] = notch_filter(img)

%NOTCH_FILTER Summary of this function goes here
%   Detailed explanation goes here
    img = double(img);
    im_size = size(img);
    spectrum_img = fftshift(fft2(img));
    u = 1:im_size(1);
    v = 1:im_size(2);
    [U, V] = meshgrid(u,v);

    
    H_nr = ones(im_size);

    D1 = abs(U-im_size(2)/2);
    D2 = abs(V-im_size(2)/2);
    H_nr(D1<=3)=0.3;
    H_nr(D2<=3)=1;
    H_np = 1-H_nr;
    filtered_image = spectrum_img .* H_nr;
end

