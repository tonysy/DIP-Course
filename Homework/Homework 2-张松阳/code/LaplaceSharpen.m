function [image] = LaplaceSharpen(image, laplace_kernel)
    %
    % Laplace Sharpening
    % Args:
    %   image: 
    %      
    %   laplace_kernel:
    %       kernel matrix
    % Return:
    %   image
    % 
    
    w = size(image, 1);
    h = size(image, 2);
    
    % Padding the image
    new_image = zeros(w+2, h+2);
    new_image(2:1+w,2:1+h) = image;
    
    for i = 1:w
        for j = 1:h
            patch = new_image(i:i+2,j:j+2);
            value = sum(sum(patch.*laplace_kernel));
            image(i,j) = value;
        end
    end
    
%     image_min = min(image(:));
%     image = image - image_min;
end

