
function filteredImage = test5_applyIdealHighPassFilter(image, radius)
    [M, N] = size(image);
    [X, Y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
    highPassFilter = sqrt(X.^2 + Y.^2) > radius;
    fftShifted = fftshift(fft2(double(image)));
    filteredFFT = fftShifted .* highPassFilter;
    filteredImage = real(ifft2(ifftshift(filteredFFT)));
end