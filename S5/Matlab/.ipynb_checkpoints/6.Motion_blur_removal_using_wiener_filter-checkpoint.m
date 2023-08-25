

%% s5


img = imread('test.tif');
k = 0.1; 
[M, N] = size(img);
motion_length = 5; 
motion_angle = 0; 
T = 0.1; 
H_uv = zeros(M, N);
u = 1:M;
v = 1:N;
U = u - M/2;
V = v - N/2;
theta = motion_angle * pi/180;
H_uv = T * (sinc(U * T) .* exp(-1i * pi * V * T * tan(theta)));
fft_image = fft2(img);
fft_h = fft2(H_uv);
khat = k ./ abs(fft_h).^2;
% wiener
filtered_fft_image = khat .* fft_image;
filtered_image = ifft2(filtered_fft_image);
figure;
imshow(uint8(abs(filtered_image)));
title('Wiener');
