function [ image ] = MedianFilter(image, shape)
    %
    % Median Filtering for image
    % Args:
    %   image: 
    %       image matrix
    %   shape:
    %       'same': use padding
    % Return:
    %   image
    % 
    
    % Get image size     
    w = size(image, 1);
    h = size(image, 2);
    
    % Padding the image
    new_image = zeros(w+2, h+2);
    new_image(2:1+w,2:1+h) = image;
    
    % Get Median value for each 3x3 patch
    for i = 1:w
        for j = 1:h
            patch = new_image(i:i+2,j:j+2);
            mid_patch = median(patch(:));
            image(i,j) = mid_patch;
        end
    end
end

