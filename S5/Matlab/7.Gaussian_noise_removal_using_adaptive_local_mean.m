
%% s5
clc;
clear all;

% MATLAB CODE for Adaptive filtering- Local Noise filter  
X = imread('cameraman.tif');
Y = X;
sz = size(Y,1)*size(Y,2);
  
% Add gaussian noise with mean 0 and variance 0.010
y = imnoise(Y,'gaussian',0,0.05);
figure,imshow(y); title('Image with gaussian noise');
  
y = double(y);
  
% Define the window size mxn
U = 10;
V = 10;
  
% Fill the matrix up on all sides with zeros.
Z = padarray(Y,[floor(N/2),floor(M/2)]);
  
lvar = zeros([size(y,1) size(y,2)]);
lmean = zeros([size(y,1) size(y,2)]);
temp = zeros([size(y,1) size(y,2)]);
NewImg = zeros([size(y,1) size(y,2)]);
  
for i = 1:size(Z,1)-(N-1)
    for j = 1:size(Z,2)-(M-1)
  
 temp = Z(i:i+(N-1),j:j+(M-1));
        tmp =  temp(:);
             % Determine the region's local mean and variance.        
        lmean(i,j) = mean(tmp);
        lvar(i,j) = mean(tmp.^2)-mean(tmp).^2;
          
    end
end
  
% Commotion fluctuation and normal 
% of the neighborhood change
nvar = sum(lvar(:))/sz;
  
% If noise_variance > local_variance 
% then local_variance=noise_variance
 lvar = max(lvar,nvar);     
  
% Final_Image = Y- (noise variance/
% local variance)*(Y-local_mean);
 NewImg = nvar./lvar;
 NewImg = NewImg.*(Y-lmean);
 NewImg = Y-NewImg;
  
% Convert the image to uint9 format.
 NewImg = uint9(NewImg);
figure,imshow(NewImg);title('Restored Image using Adaptive Local filter');