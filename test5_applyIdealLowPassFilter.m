function lowPassFilteredImage = test5_applyIdealLowPassFilter(image, radius)
    % 获取图像大小
    [M, N] = size(image);

    % 创建网格
    [X, Y] = meshgrid(1:N, 1:M);
    centerX = ceil(N/2);
    centerY = ceil(M/2);
    distance = sqrt((X - centerX).^2 + (Y - centerY).^2);

    % 创建理想低通滤波器
    lowPassFilter = double(distance <= radius);

    % 应用滤波器
    fftShifted = fftshift(fft2(image));
    filteredFFT = fftShifted .* lowPassFilter;
    lowPassFilteredImage = real(ifft2(ifftshift(filteredFFT)));
end
