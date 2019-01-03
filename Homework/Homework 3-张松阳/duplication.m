function output_image = duplication(input_image, rescale_factor)

[H, W] = size(input_image);

if rescale_factor == 0
    output_image = input_image;
elseif rescale_factor > 0
    for i = 1:H*rescale_factor
        for j = 1:W*rescale_factor
            output_image(i,j) = input_image(ceil(i/rescale_factor), ceil(j/rescale_factor));
        end
    end
else
    for i = 1:H / abs(rescale_factor)
        for j = 1:W/abs(rescale_factor)
            output_image(i,j) = input_image(i*abs(rescale_factor), j*abs(rescale_factor));
        end
    end
    
end

end

