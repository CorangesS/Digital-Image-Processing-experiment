% 分别利用梯度算子、Roberts、Prewitt 和Sobel等一阶微分算子，
% 对数字图像test6、test7进行微分运算，计算出梯度幅值，显示处理前、后图像。
% 读取图像
% grayImage = imread('数据/test6.tif');
grayImage = imread('数据/test7.tif');
figure;
subplot(2, 3, 1);
imshow(grayImage);
title('原始图像');

% 梯度算子-------------------------------------------------------
[gradientX, gradientY] = imgradientxy(grayImage, 'sobel');
gradientMagnitude_grad = sqrt(gradientX.^2 + gradientY.^2);

subplot(2, 3, 2);
imshow(gradientMagnitude_grad, []);
title('梯度算子处理后图像');

% Roberts算子----------------------------------------------------
[gradientMagnitude_Roberts, ~] = imgradient(grayImage, 'Roberts');

subplot(2, 3, 3);
imshow(gradientMagnitude_Roberts, []);
title('Roberts算子处理后图像');
% Prewitt算子----------------------------------------------------
[gradientMagnitude_Prewitt, ~] = imgradient(grayImage, 'Prewitt');

subplot(2, 3, 4);
imshow(gradientMagnitude_Prewitt, []);
title('Prewitt算子处理后图像');
% Sobel算子------------------------------------------------------
[gradientMagnitude_Sobel, ~] = imgradient(grayImage, 'Sobel');

subplot(2, 3, 5);
imshow(gradientMagnitude_Sobel, []);
title('Sobel算子处理后图像');
% Laplacian 二阶算子----------------------------------------------
% 创建 Laplacian 算子
laplacianFilter = fspecial('laplacian', 0);
% 应用 Laplacian 算子
laplacianImage_Laplacian = imfilter(double(grayImage), laplacianFilter, 'replicate');

figure;
subplot(1, 2, 1);
imshow(grayImage);
title('原始图像');
subplot(1, 2, 2);
imshow(laplacianImage_Laplacian, []);
title('Laplacian算子处理后图像');

% 边缘检测部分:-------------------------------------------------------------
% 选择适当的阈值分别对一阶和二阶微分算子处理后的图像进行阈值化处理
% 检测出边缘。显示阈值化处理后的图像
figure;
subplot(2, 3, 1);
imshow(grayImage);
title('原始图像');
% 梯度算子-------------------------------------------------------
thresholdValue = 50;  % 示例阈值
gradientMagnitude_grad = gradientMagnitude_grad > thresholdValue;

subplot(2, 3, 2);
imshow(gradientMagnitude_grad);
title('阈值化grad算子边缘检测图');
% Roberts算子----------------------------------------------------
thresholdValue = 50;  % 示例阈值
gradientMagnitude_Roberts = gradientMagnitude_Roberts > thresholdValue;

subplot(2, 3, 3);
imshow(gradientMagnitude_Roberts);
title('阈值化Roberts算子边缘检测图');
% Prewitt算子----------------------------------------------------
thresholdValue = 50;  % 示例阈值
gradientMagnitude_Prewitt = gradientMagnitude_Prewitt > thresholdValue;

subplot(2, 3, 4);
imshow(gradientMagnitude_Prewitt);
title('阈值化Prewitt算子边缘检测图');
% Sobel算子------------------------------------------------------
thresholdValue = 50;  % 示例阈值
gradientMagnitude_Sobel = gradientMagnitude_Sobel > thresholdValue;

subplot(2, 3, 5);
imshow(gradientMagnitude_Sobel);
title('阈值化Sobel算子边缘检测图');
% Laplacian 二阶算子----------------------------------------------
thresholdValue = 30;  % 示例阈值
laplacianImage_Laplacian = laplacianImage_Laplacian > thresholdValue;

subplot(2, 3, 6);
imshow(laplacianImage_Laplacian);
title('阈值化Laplacian算子边缘检测图');

%% 在test6图像中砖墙结构产生较多的细节分量，它们往往表现为噪声
% 微分计算增强了这些噪声，从而使图像中主要边缘的检测变得复杂
% 为了减少这些噪声，可先对图像进行平滑处理，如采用5*5的均值平滑滤波器
% 然后再进行微分运算和阈值化.显示处理过程图像和结果图
% 读取图像
originalImage  = imread('数据/test6.tif');

% 转换为灰度图像（如果它不是灰度图像）
grayImage = originalImage;
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
end
% 应用 5x5 均值滤波器
meanFilter = fspecial('average', [5 5]);
smoothedImage = imfilter(grayImage, meanFilter, 'replicate');

% 使用 Sobel 算子计算梯度幅值
[gradientMagnitude, ~] = imgradient(smoothedImage, 'Sobel');

% 选择适当的阈值进行阈值化处理
thresholdValue = 50;  % 示例阈值，根据需要调整
edgeDetectedImage = gradientMagnitude > thresholdValue;

% 显示处理过程中的图像和最终结果
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('原始图像');
subplot(2, 2, 2);
imshow(smoothedImage, []);
title('均值滤波平滑后的图像');
subplot(2, 2, 3);
imshow(gradientMagnitude, []);
title('Sobel 微分图像');
subplot(2, 2, 4);
imshow(edgeDetectedImage);
title('阈值化处理后的边缘检测图像');