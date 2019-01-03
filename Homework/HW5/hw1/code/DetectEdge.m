function [grad, mask] = DetectEdge(img, T)
    
% Define mask
sobel_x = [-1, -2, -1; 
            0, 0, 0; 
            1, 2, 1];
sobel_y = [-1, 0, 1; 
            -2, 0, 2; 
            -1, 0, 1];

% Apply it
g_x = conv2(double(img), sobel_x,'same');
g_y = conv2(double(img), sobel_y,'same');


% Compare it with threshold
grad = abs(g_x) + abs(g_y);
mask = grad>T;

end

