%% 读test3.jpg进行二维傅里叶变换令其幅度谱为常数A，仅利用相位谱反傅里叶变换重建原图像
% 读取图像
grayImage = imread('数据/test3.tif');
% 进行二维傅里叶变换
fftImage = fft2(double(grayImage));
% 将零频率分量移动到频谱中心
fftShift = fftshift(fftImage);
% 计算幅度谱并进行对数变换以增强显示效果
amplitudeSpectrum = log(1 + abs(fftShift));
% 计算相位谱
phaseSpectrum = angle(fftShift);

% 显示幅度谱图和相位谱图
figure;
subplot(1, 2, 1);
imshow(amplitudeSpectrum, []);
title('傅里叶变换幅度谱');
subplot(1, 2, 2);
imshow(phaseSpectrum, []);
title('傅里叶变换相位谱');
%% 令其幅度谱为常数A，仅利用相位谱反傅里叶变换重建原图像
% 设置幅度谱为常数A
A = 1;
constantAmplitude = A * ones(size(grayImage));
% 用常数幅度和原始相位进行反傅里叶变换
reconstructedImage = ifft2(ifftshift(constantAmplitude .* exp(1i * phaseSpectrum)));
% 取实部，因为输出应该是实数
reconstructedImage = real(reconstructedImage);

% 显示幅度谱图和相位谱图
figure;
subplot(1, 2, 1);
imshow(amplitudeSpectrum, []);
title('傅里叶变换幅度谱');
subplot(1, 2, 2);
imshow(phaseSpectrum, []);
title('傅里叶变换相位谱');
% 显示重建的图像
figure;
imshow(reconstructedImage, []);
title('仅使用相位谱重建的图像');
% 保存重建的图像
imwrite(uint8(reconstructedImage), '数据/test3_IFFT.jpg');
%% 令相位谱为0，仅利用幅度谱进行反傅里叶变换重建原图像
% 设置相位谱为0
zeroPhase = zeros(size(grayImage));

% 用原始幅度和零相位进行反傅里叶变换
reconstructedImage = ifft2(ifftshift(amplitudeSpectrum .* exp(1i * zeroPhase)));

% 取实部，因为输出应该是实数
reconstructedImage = real(reconstructedImage);
% 显示重建的图像
figure;
imshow(reconstructedImage, []);
title('仅使用幅度谱重建的图像');
%% 用sy2_亮度图.jpg的幅度谱与test3.tif的相位谱进行反傅里叶变换
% 读取两幅图像
image2 = imread('数据/sy2_亮度图.jpg');
image3 = imread('数据/test3.tif');

% 对两幅图像进行二维傅里叶变换
fftImage2 = fft2(double(image2));
fftImage3 = fft2(double(image3));

% 提取幅度谱和相位谱
amplitudeSpectrum2 = abs(fftshift(fftImage2));
phaseSpectrum3 = angle(fftshift(fftImage3));

% 结合幅度谱和相位谱
combinedFFT = amplitudeSpectrum2 .* exp(1i * phaseSpectrum3);

% 进行反傅里叶变换
combinedImage = ifft2(ifftshift(combinedFFT));

% 取实部
combinedImage = real(combinedImage);

% 保存新图像
imwrite(uint8(combinedImage), '数据/test3_幅度谱相位谱混合图.jpg');

% 显示新图像
figure;
imshow(combinedImage, []);
title('使用2.jpg的幅度谱与3.jpg的相位谱构建的3_re.jpg');
