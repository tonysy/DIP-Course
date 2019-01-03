function [sinnoise] = sin_noise(A, im_size)
%SIN_NOISE Summary of this function goes here
%   Detailed explanation goes here
    x_loc = 1:im_size(1);
    y_loc = 1:im_size(2);
    
    N = im_size(1);
    
    [Y, X] = meshgrid(x_loc, y_loc);
    
    sinnoise = A * cos(N * X /2 + 0 * Y);
end

