function [noised_image] = salt_pepper(img, a, b, pa, pb, imshape)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
       
    numPixel = imshape*imshape;
    saltLoc = randperm(numPixel, round(pb*numPixel));
    pepperLoc = randperm(numPixel, round(pa*numPixel));
    
    img(saltLoc) = b;
    img(pepperLoc) = a;
    noised_image = img;
    
end

