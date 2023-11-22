%% test5.gif幅度谱
% 读取图像
originalImage = imread('数据/test5.gif');
% 进行二维傅里叶变换
fftOriginal = fft2(double(originalImage));
fftShift = fftshift(fftOriginal);
% 计算幅度谱并进行对数变换以增强显示效果
amplitudeSpectrum = log(1 + abs(fftShift));
% 显示原始图像及其傅里叶幅度谱图
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('原始图像');
subplot(1, 2, 2);
imshow(amplitudeSpectrum, []);
title('傅里叶幅度谱');
%% 选择适当的滤波半径，在频域分别进行理想低通、理想高通、高斯低通、高斯高通滤波
% 选择两种滤波半径进行理想低通滤波
radius1 = 30; % 滤波半径1
radius2 = 70; % 滤波半径2
% 应用理想低通滤波器
filteredImage1 = test5_applyIdealLowPassFilter(originalImage, radius1);
filteredImage2 = test5_applyIdealLowPassFilter(originalImage, radius2);

% 显示滤波后的结果图像
figure;
subplot(1, 2, 1);
imshow(filteredImage1, []);
title(['理想低通滤波半径', num2str(radius1)]);
subplot(1, 2, 2);
imshow(filteredImage2, []);
title(['理想低通滤波半径', num2str(radius2)]);
%% 不同半径下理想高通滤波器
filteredImage30 = test5_applyIdealHighPassFilter(originalImage, 30);
filteredImage70 = test5_applyIdealHighPassFilter(originalImage, 70);

% 显示滤波后的结果图像
figure;
subplot(1, 2, 1);
imshow(filteredImage30, []);
title('理想高通滤波半径 30');
subplot(1, 2, 2);
imshow(filteredImage70, []);
title('理想高通滤波半径 70');
%% 高斯低通
filteredImage30 = test5_applyGaussianLowPassFilter(originalImage, 30);
filteredImage70 = test5_applyGaussianLowPassFilter(originalImage, 70);

% 显示滤波后的结果图像
figure;
subplot(1, 2, 1);
imshow(filteredImage30, []);
title('高斯低通滤波半径 30');
subplot(1, 2, 2);
imshow(filteredImage70, []);
title('高斯低通滤波半径 70');
%% 高斯高通
filteredImage30 = test5_applyGaussianHighPassFilter(originalImage, 30);
filteredImage70 = test5_applyGaussianHighPassFilter(originalImage, 70);

% 显示滤波后的结果图像
figure;
subplot(1, 2, 1);
imshow(filteredImage30, []);
title('高斯高通滤波半径 30');
subplot(1, 2, 2);
imshow(filteredImage70, []);
title('高斯高通滤波半径 70');