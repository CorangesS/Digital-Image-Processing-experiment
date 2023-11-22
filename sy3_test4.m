%% 对test4,jpg分别加入高斯噪声、椒盐噪声。
originalImage = imread('数据/test4.gif');
% 添加高斯噪声
gaussianNoiseImage = imnoise(originalImage, 'gaussian');
% 添加椒盐噪声
saltPepperNoiseImage = imnoise(originalImage, 'salt & pepper');

% 显示三张图像
figure;
subplot(1, 3, 1);
imshow(originalImage);
title('原始图像');
subplot(1, 3, 2);
imshow(gaussianNoiseImage);
title('高斯噪声图像');
subplot(1, 3, 3);
imshow(saltPepperNoiseImage);
title('椒盐噪声图像');
%% 利用邻域平均法，分别采用33，55模板对加噪声图像进行平滑处理，显示原图像、加噪图像和处理后的图像。
% 创建 3x3 和 5x5 模板
h3 = fspecial('average', [3 3]);
h5 = fspecial('average', [5 5]);
% 对高斯噪声图像应用 3x3 和 5x5 模板
gaussian3x3 = filter2(h3, gaussianNoiseImage);
gaussian5x5 = filter2(h5, gaussianNoiseImage);
% 对椒盐噪声图像应用 3x3 和 5x5 模板
saltPepper3x3 = filter2(h3, saltPepperNoiseImage);
saltPepper5x5 = filter2(h5, saltPepperNoiseImage);

% 显示结果
figure;
subplot(2, 3, 1);
imshow(gaussianNoiseImage);
title('高斯噪声图像');
subplot(2, 3, 2);
imshow(gaussian3x3, []);
title('高斯噪声 - 3x3 模板');
subplot(2, 3, 3);
imshow(gaussian5x5, []);
title('高斯噪声 - 5x5 模板');
subplot(2, 3, 4);
imshow(saltPepperNoiseImage);
title('椒盐噪声图像');
subplot(2, 3, 5);
imshow(saltPepper3x3, []);
title('椒盐噪声 - 3x3 模板');
subplot(2, 3, 6);
imshow(saltPepper5x5, []);
title('椒盐噪声 - 5x5 模板');
%% 利用中值滤波法，分别采用33，55模板对加噪声图像进行去噪处理，显示原图像、加噪图像和处理后的图像
% 应用 3x3 和 5x5 中值滤波
gaussian3x3 = medfilt2(gaussianNoiseImage, [3 3]);
gaussian5x5 = medfilt2(gaussianNoiseImage, [5 5]);
saltPepper3x3 = medfilt2(saltPepperNoiseImage, [3 3]);
saltPepper5x5 = medfilt2(saltPepperNoiseImage, [5 5]);

% 显示结果
figure;
subplot(2, 3, 1);
imshow(gaussianNoiseImage);
title('高斯噪声图像');
subplot(2, 3, 2);
imshow(gaussian3x3);
title('高斯噪声 - 3x3 中值滤波');
subplot(2, 3, 3);
imshow(gaussian5x5);
title('高斯噪声 - 5x5 中值滤波');
subplot(2, 3, 4);
imshow(saltPepperNoiseImage);
title('椒盐噪声图像');
subplot(2, 3, 5);
imshow(saltPepper3x3);
title('椒盐噪声 - 3x3 中值滤波');
subplot(2, 3, 6);
imshow(saltPepper5x5);
title('椒盐噪声 - 5x5 中值滤波');