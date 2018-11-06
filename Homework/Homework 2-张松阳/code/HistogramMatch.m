function [mapping] = HistogramMatch(image, image_ref)
    %
    % Histogram Matching
    % Args:
    %   image: 
    %       image matrix
    %   image_ref:
    %       reference image matrix
    % Return:
    %   mapping
    % 
    
    % Compute the hist of two images
    hist = imhist(image);
    hist_ref = imhist(image_ref);
    
    % Compute CDFs
    image_cdf = cumsum(hist)' / numel(image);
    image_cdf_ref = cumsum(hist_ref)' / numel(image_ref);
    
    % Get Mapping 
    mapping = zeros(256,1);
    for i = 1: 256
        [value, index] = min(abs(image_cdf(i) - image_cdf_ref));
        mapping(i) = index - 1;
    end
end

