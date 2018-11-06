function [ hist_equalization ] = HistogramEqua(image)
    [hist_value, hist_value_prob] = Histogram(image);
    w = size(image, 1);
    h = size(image, 2);
    
    for i = 1:w
        for j = 1:h
            gray_level = image(i, j);
            image(i, j) = sum( hist_value_prob(1:gray_level))*255;
        end
    end
    
    hist_equalization = image;
end