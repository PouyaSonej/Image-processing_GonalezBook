

%% s5


img = imread('cameraman.tif');

%motion blur
motion_length = 5; 
motion_angle = 0; 
h = fspecial('motion', motion_length, motion_angle);
blurred_image = imfilter(img, h, 'conv', 'circular');
figure;
imshow(blurred_image);

