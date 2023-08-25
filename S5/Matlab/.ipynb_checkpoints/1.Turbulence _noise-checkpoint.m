

%% s5

img = imread('Fig_5_25.tif');
[M, N] = size(img);
Distortion = zeros(M, N);
k_val = [0.001, 0.0025, 0.1];
for i = 1:numel(k_val)
    k = k_val(i);
    for u = 1:M
        for v = 1:N
            
            H_uv = exp(-k * ((u - M/2)^2 + (v - N/2)^2)^(5/6));
            Distortion(u, v) = H_uv;
        end
    end
    Distorted_image = double(img) .* Distortion;
    figure;
    imshow(uint8(Distorted_image));
    title(sprintf('k = %.4f', k));
end
