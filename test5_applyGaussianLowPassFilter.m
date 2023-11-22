% 高斯低通滤波器函数
function filteredImage = test5_applyGaussianLowPassFilter(image, radius)
    [M, N] = size(image);
    [X, Y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
    gaussianFilter = exp(-((X.^2 + Y.^2) / (2 * radius^2)));
    fftShifted = fftshift(fft2(double(image)));
    filteredFFT = fftShifted .* gaussianFilter;
    filteredImage = real(ifft2(ifftshift(filteredFFT)));
end