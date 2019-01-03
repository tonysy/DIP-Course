clc;
clear;

tmpf = load("Test3.mat");
img = tmpf.f;
imshow(img);


%% Ostu
[cnts, locs] =imhist(img);

pi = double(cnts)/sum(cnts);


% calculate cumulative sums
cum_p = cumsum(pi); 

% Compute the cumulative means

m = cumsum((1:length(pi))' .* pi);

% The global intensity mean
m_g = m(length(m));

sigma = (m_g*cum_p - m).^2 ./ (cum_p.*(1-cum_p));

[val, k] = max(sigma);

mask = img>=k;

figure;
imshow(mask);
title('Mask with Otsu');
pause;

%% Region Growing
dx = [-1,-1,-1, 0, 0, 1, 1, 1,];
dy = [-1, 0, 1, -1, 1, -1, 0, 1];
seeds = [541 162;530 186;99 518; 343 287;339 214; 541 162;530 186; 228 374;271 531];
rmask = zeros(size(img));
props = zeros(size(img));

rmask(530,186)=1;
rmask(228,374)=1;
rmask(271,531)=1;

rmask(99,518)=1;
rmask(343,287)=1;
rmask(339,214)=1;
rmask(541,162)=1;


cnt=0;
while 1
   cnt=cnt+1;
   flag = 0;
   for i=1:size(seeds,1)
        x = seeds(i,1);
        y = seeds(i,2);
        if props(x,y)==1
            continue
        end
        for dx=-2:2
            for dy=-2:2
            nx = x+dx;
            ny = y+dy;
            if nx<1 | nx>size(img,1) | ny<1 | ny>size(img,2) | mask(nx,ny)==0
                continue;
            end
            seeds = vertcat(seeds,[nx,ny]);
            rmask(nx,ny)=1;
            flag=1;
            end
        end
        props(x,y)=1;
   end
   if not(flag) | cnt>100
       break;
   end
end
figure;
imshow(rmask);
title('Two largest rings');
