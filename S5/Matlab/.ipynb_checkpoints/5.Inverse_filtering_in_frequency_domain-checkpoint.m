

%% s5



img = imread('cameraman.tif');
R = 40; 
fft_image = fft2(img);
[M, N] = size(img);
half_M = floor(M/2);
half_N = floor(N/2);
mask = zeros(M, N);
for u = 1:M
    for v = 1:N
        if sqrt((u-half_M)^2 + (v-half_N)^2) < R
            mask(u, v) = 1;
        end
    end
end
filtered_fft_image = fft_image ./ mask;
filtered_image = ifft2(filtered_fft_image);
figure;
imshow(uint8(abs(filtered_image)));

