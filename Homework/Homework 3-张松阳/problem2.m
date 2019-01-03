clc;close all;

load('Test2.mat');
origin = f;
% Cut-off frequency
d0 = 50;

figure(1);
subplot(3,2,1);
imshow(origin, []);
title('Original');

% laplace operator
kernel = [0 -1 0;-1 4 -1;0 -1 0];
out3 = origin+conv2(origin, kernel, 'same');
subplot(3,2,3);
imshow(out3,[]);
title('Laplace filtered');

% IHBF
[H, W] = size(f);
u = -H:H-1;
v = -W:W-1;

c_ihpf = 1;
[u,v] = meshgrid(u,v);
d_ihpf = sqrt(u.^2+v.^2);
f_shift = fftshift(fft2(origin,2*H,2*W));
h_ihpf = double(d_ihpf > d0);
ret1 = real(ifft2(ifftshift(h_ihpf.*f_shift)));
out4 = uint8(origin) + c_ihpf*uint8(ret1(1:H,1:W));
subplot(3,2,4);
imshow(out4, []);
title('IHBF filtered(c=2,d0=50hz)');


% BHPF
n = 2;
c_ihpf = 5;
h_ihpf = 1./(1+d0./d_ihpf).^(2*n);
ret2 = real(ifft2(ifftshift(h_ihpf.*f_shift)));
out5 = uint8(origin) + c_ihpf*uint8(ret2(1:H,1:W));
subplot(3,2,5);
imshow(out5,[]);
title('BHPF filtered(c=5,d0=50hz,n=2)');

% GHPF
c_ghpf = 2;
h_ghpf = 1-exp(-(d_ihpf.^2)./(d0^2*2));
ret3 =  real(ifft2(ifftshift(h_ghpf.*f_shift)));
out6 = uint8(origin) + c_ghpf*uint8(ret3(1:H, 1:W));
subplot(3,2,6);
imshow(out6,[]);
title('GHPF filtered(c=2,d0=50hz');




%

d0 = 100;

figure(2);
subplot(3,2,1);
imshow(origin, []);
title('Original');

% laplace operator
kernel = [0 -1 0;-1 4 -1;0 -1 0];
out3 = origin+conv2(origin, kernel, 'same');
subplot(3,2,3);
imshow(out3,[]);
title('Laplace filtered');

% IHBF
[H, W] = size(f);
u = -H:H-1;
v = -W:W-1;

c_ihpf = 1;
[u,v] = meshgrid(u,v);
d_ihpf = sqrt(u.^2+v.^2);
f_shift = fftshift(fft2(origin,2*H,2*W));
h_ihpf = double(d_ihpf > d0);
ret1 = real(ifft2(ifftshift(h_ihpf.*f_shift)));
out4 = uint8(origin) + c_ihpf*uint8(ret1(1:H,1:W));
subplot(3,2,4);
imshow(out4, []);
title('IHBF filtered(c=2,d0=100hz)');


% BHPF
n = 2;
c_ihpf = 5;
h_ihpf = 1./(1+d0./d_ihpf).^(2*n);
ret2 = real(ifft2(ifftshift(h_ihpf.*f_shift)));
out5 = uint8(origin) + c_ihpf*uint8(ret2(1:H,1:W));
subplot(3,2,5);
imshow(out5,[]);
title('BHPF filtered(c=5,d0=100hz,n=2)');

% GHPF
c_ghpf = 2;
h_ghpf = 1-exp(-(d_ihpf.^2)./(d0^2*2));
ret3 =  real(ifft2(ifftshift(h_ghpf.*f_shift)));
out6 = uint8(origin) + c_ghpf*uint8(ret3(1:H, 1:W));
subplot(3,2,6);
imshow(out6,[]);
title('GHPF filtered(c=2,d0=100hz');


d0 = 150;

figure(3);
subplot(3,2,1);
imshow(origin, []);
title('Original');

% laplace operator
kernel = [0 -1 0;-1 4 -1;0 -1 0];
out3 = origin+conv2(origin, kernel, 'same');
subplot(3,2,3);
imshow(out3,[]);
title('Laplace filtered');

% IHBF
[H, W] = size(f);
u = -H:H-1;
v = -W:W-1;

c_ihpf = 1;
[u,v] = meshgrid(u,v);
d_ihpf = sqrt(u.^2+v.^2);
f_shift = fftshift(fft2(origin,2*H,2*W));
h_ihpf = double(d_ihpf > d0);
ret1 = real(ifft2(ifftshift(h_ihpf.*f_shift)));
out4 = uint8(origin) + c_ihpf*uint8(ret1(1:H,1:W));
subplot(3,2,4);
imshow(out4, []);
title('IHBF filtered(c=2,d0=150hz)');


% BHPF
n = 2;
c_ihpf = 5;
h_ihpf = 1./(1+d0./d_ihpf).^(2*n);
ret2 = real(ifft2(ifftshift(h_ihpf.*f_shift)));
out5 = uint8(origin) + c_ihpf*uint8(ret2(1:H,1:W));
subplot(3,2,5);
imshow(out5,[]);
title('BHPF filtered(c=5,d0=150hz,n=2)');

% GHPF
c_ghpf = 2;
h_ghpf = 1-exp(-(d_ihpf.^2)./(d0^2*2));
ret3 =  real(ifft2(ifftshift(h_ghpf.*f_shift)));
out6 = uint8(origin) + c_ghpf*uint8(ret3(1:H, 1:W));
subplot(3,2,6);
imshow(out6,[]);
title('GHPF filtered(c=2,d0=150hz');