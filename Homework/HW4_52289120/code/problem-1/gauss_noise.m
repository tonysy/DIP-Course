function [guassianImg] = gauss_noise(mean, var, imshape)
%IM_NOISE Summary of this function goes here
%   Detailed explanation goes here
guassianImg = sqrt(var)*randn(imshape) + mean;

end

