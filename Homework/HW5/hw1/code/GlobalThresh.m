function [threshold] = GlobalThresh(img, init_threshold)


threshold = init_threshold;

while 1
   mask = img<=threshold;
   imask = not(mask);
   g1 = sum(sum(img(mask))) / sum(mask(:));
   g2 = sum(sum(img(imask))) / sum(imask(:));
   new_threshold = (g1+g2)/2;
   if new_threshold==threshold
       return
   else
       threshold=new_threshold;
   end
end

end

