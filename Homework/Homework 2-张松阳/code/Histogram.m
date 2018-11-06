function [ hist_value, hist_value_prob ] = Histogram(image)
    %
    % Calculate Histogram 
    % Args:
    %   image: 
    %       image matrix
    %   
    % Return:
    %   hist_value:
    %       histogram value (number of each gray level)    
    %   hist_vale: 
    %       histogram value (percentage of each gray level)
    
    % Get Statistics of Image
    image = image(:);
    hist_value = zeros(256,1);
    
    % Calculate number of each intensity level
    length = size(image, 1);
    for i = 1:length
        hist_value(image(i)) = hist_value(image(i))+ 1;
    end
    hist_value_prob = hist_value';
    
    % Calculate percentage of each intenstiy level
    for i = 1:256
        hist_value_prob(i) = hist_value_prob(i) / length;
    end
%     results = tabulate(image);
    % Get Valid intensity
%     intensity = results(:,1)';
    % Get Percentage of intensity
%     value = results(:,3)';
end



            
            