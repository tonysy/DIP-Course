function [rmask] = RegionGrow(image, mask)


dx = [-1,-1,-1, 0, 
      0, 1, 1, 1,];
dy = [-1, 0, 1, -1, 
      1, -1, 0, 1];
  
seeds = [541 162;
        530 186;
        99 518; 
        343 287;
        339 214; 
        541 162;
        530 186; 
        228 374;
        271 531];
    
rmask = zeros(size(img));
props = zeros(size(img));

rmask(530,186)=1;
rmask(228,374)=1;
rmask(271,531)=1;

rmask(99,518)=1;
rmask(343,287)=1;
rmask(339,214)=1;
rmask(541,162)=1;


count=0;

while 1
   count=count+1;
   flag = 0;
   for i=1:size(seeds,1)
        x = seeds(i,1);
        y = seeds(i,2);
        if props(x,y)==1
            continue
        end
        for dx=-1:1
            for dy=-1:1
            nx = x+dx;
            ny = y+dy;
            if nx<1 | nx>size(image,1) | ny<1 | ny>size(image,2) | mask(nx,ny)==0
                continue;
            end
            seeds = vertcat(seeds,[nx,ny]);
            rmask(nx,ny)=1;
            flag=1;
            end
        end
        props(x,y)=1;
   end
   if not(flag) | count>100
       break;
   end
end

end

