% Stretching Function
function [ Y ] = PieceLinear(x, r1, s1, r2, s2)
    
    % For First line 
    k1 = s1 / r1;
    % For Second line 
    dk1 = (s2-s1) / (r2-r1);
    % For Third line 
    dk2 = (255-s2) / (255-r2);
    if x < r1
        Y = k1 * x;
    elseif x < r2
        Y = dk1 * (x - r1) + s1;
    else
        Y = dk2 * (x - r2) + s2;
    end
end

