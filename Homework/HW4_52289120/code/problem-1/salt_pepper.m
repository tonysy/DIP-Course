function [noised_image] = salt_pepper(img, a, b, pa, pb, imshape)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
       
    numPixel = imshape*imshape;
    saltLoc = randperm(numPixel, round(pb*numPixel));
    pepperLoc = randperm(numPixel, round(pa*numPixel));
    
    img(saltLoc) = b;
    img(pepperLoc) = a;
    noised_image = img;
    
end

