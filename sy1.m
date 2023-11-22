%% 实验1.1图像灰度线性变换
grayImage = imread('数据/test1.jpg');
% 转换为灰度图像（如果它不是灰度图像）
% grayImage = rgb2gray(image);
% 计算直方图
histogram = imhist(grayImage);

% 显示直方图
figure;
bar(histogram);
title('灰度直方图');
xlabel('灰度值');
ylabel('频数');

% 定义原始灰度范围 [fa, fb] 和目标灰度范围 [ga, gb]
fa = 50; % 示例值
fb = 200; % 示例值
ga = 100; % 示例值
gb = 250; % 示例值

% 线性变换
slope = (gb - ga) / (fb - fa);
intercept = ga - slope * fa;
transformedImage = uint8(zeros(size(grayImage)));
for i = 1:size(grayImage, 1)
    for j = 1:size(grayImage, 2)
        transformedValue = slope * double(grayImage(i, j)) + intercept;
        transformedValue = min(max(transformedValue, ga), gb); % 确保值在 [ga, gb] 范围内
        transformedImage(i, j) = uint8(transformedValue);
    end
end

% 显示原始图像和变换后的图像
figure;
subplot(1, 2, 1);
imshow(grayImage);
title('原始灰度图像');

subplot(1, 2, 2);
imshow(transformedImage);
title('变换后的灰度图像');
%% 实验1.2图像的均衡化处理
% 读取灰度图像
grayImage = imread('数据/test2.jpg');

% 计算原始图像的直方图
originalHistogram = imhist(grayImage);

% 进行图像均衡化处理
equalizedImage = histeq(grayImage);

% 计算均衡化后图像的直方图
equalizedHistogram = imhist(equalizedImage);

% 显示原始图像和均衡化后的图像及其直方图
figure;
subplot(2, 2, 1);
imshow(grayImage);
title('原始灰度图像');

subplot(2, 2, 2);
imshow(equalizedImage);
title('均衡化后的灰度图像');

subplot(2, 2, 3);
bar(originalHistogram);
title('原始灰度直方图');
xlabel('灰度值');
ylabel('频数');

subplot(2, 2, 4);
bar(equalizedHistogram);
title('均衡化后的灰度直方图');
xlabel('灰度值');
ylabel('频数');
