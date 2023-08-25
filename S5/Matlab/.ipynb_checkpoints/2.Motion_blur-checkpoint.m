

%% s5


img = imread('cameraman.tif');
fft_image = fft2(img);

% motion blur
motion_length = 5; 
motion_angle = 0; 
T = 0.1; 
[M, N] = size(fft_image);
u = 1:M;
v = 1:N;
U = u - M/2;
V = v - N/2;
theta = motion_angle * pi/180;
H_uv = T * (sinc(U * T) .* exp(-1i * pi * V * T * tan(theta)));

blurred_fft_image = fft_image .* H_uv;
blurred_image = ifft2(blurred_fft_image);
figure;
imshow(uint8(abs(blurred_image)));
title('motion blur');
