%% 生成亮度图
image = zeros(500, 500);

% 定义亮块的位置和大小
% 例如，我们可以在图像中心放一个100x100的亮块
blockSize = 100; % 亮块的大小
xCenter = 250; % 亮块中心的x坐标
yCenter = 250; % 亮块中心的y坐标

% 计算亮块的左上角和右下角坐标
x1 = xCenter - blockSize / 2;
y1 = yCenter - 3*blockSize / 2;
x2 = xCenter + blockSize / 2;
y2 = yCenter + 3*blockSize / 2;
% 将亮块区域设置为255
image(y1:y2, x1:x2) = 255;
% 显示图像
imshow(image, []);
% 保存图像
imwrite(image, '数据/sy2_亮度图.jpg');
%% 亮度图进行二维傅里叶变换，同屏显示原图f 和其傅里叶变换幅度谱图
grayImage = imread('数据/sy2_亮度图.jpg');
% 进行二维傅里叶变换
fftImage = fft2(double(grayImage));

% 将零频率分量移动到频谱中心
fftShift = fftshift(fftImage);

% 计算幅度谱并进行对数变换以增强显示效果
amplitudeSpectrum = log(1 + abs(fftShift));

% 显示原始图像和幅度谱图
figure;
subplot(1, 2, 1);
imshow(grayImage);
title('原始图像');

subplot(1, 2, 2);
imshow(amplitudeSpectrum, []);
title('傅里叶变换幅度谱图');
%% 令f1(x,y)=（-1)^(x+y)* img(x,y)，重复以上过程，比较二者幅度谱的异同
image = zeros(500, 500);
blockSize = 100; % 亮块的大小
xCenter = 250; % 亮块中心的x坐标
yCenter = 250; % 亮块中心的y坐标
x1 = xCenter - blockSize / 2;
y1 = yCenter - 3*blockSize / 2;
x2 = xCenter + blockSize / 2;
y2 = yCenter + 3*blockSize / 2;
image(y1:y2, x1:x2) = 255;

for x = 1:500
    for y = 1:500
        image(x, y) = (-1)^(x + y) * image(x, y);
    end
end
imwrite(image, '数据/sy2_亮度图2.jpg');

fftImage = fft2(double(image));
fftShift = fftshift(fftImage);
amplitudeSpectrum = log(1 + abs(fftShift));

figure;
subplot(1, 2, 1);
imshow(image);
title('原始图像');

subplot(1, 2, 2);
imshow(amplitudeSpectrum, []);
title('傅里叶变换幅度谱图');

%% 若将f1(x,y)顺时针旋转45 度得到f2(x,y)，试求出并显示f2(x,y)的傅里叶幅度谱
% 读取图像
grayImage = imread('数据/sy2_亮度图2.jpg');
% 顺时针旋转图像45度
rotatedImage = imrotate(grayImage, -45);
% 保存旋转后的图像
imwrite(rotatedImage, '数据/sy2_亮度图2_rotate.jpg');
% 进行二维傅里叶变换
fftImage = fft2(double(rotatedImage));
% 将零频率分量移动到频谱中心
fftShift = fftshift(fftImage);
% 计算幅度谱并进行对数变换以增强显示效果
amplitudeSpectrum = log(1 + abs(fftShift));

% 显示幅度谱图
figure;
imshow(amplitudeSpectrum, []);
title('F2.jpg的傅里叶变换幅度谱图');
