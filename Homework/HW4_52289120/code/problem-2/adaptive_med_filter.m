function [filtered] = adaptive_med_filter(g, Smax)
%ADAPTIVE_MEDFILT2 Summary of this function goes here
%   Detailed explanation goes here

    filtered = g;
    filtered(:) = 0;
    processed = false(size(g));

    for k = 3:2:Smax
       zmin = ordfilt2(g, 1, ones(k, k), 'symmetric');
       zmax = ordfilt2(g, k * k, ones(k, k), 'symmetric');
       zmed = medfilt2(g, [k k], 'symmetric');

       using_level_B = (zmed > zmin) & (zmax > zmed) & ...
           ~processed; 
       zB = (g > zmin) & (zmax > g);
       outputZxy  = using_level_B & zB;
       outputZmed = using_level_B & ~zB;
       filtered(outputZxy) = g(outputZxy);
       filtered(outputZmed) = zmed(outputZmed);

       processed = processed | using_level_B;
       if all(processed(:))
          break;
       end
    end
end

