function [specFlux] = mySpectralFlux(xb)

%% Audio Feature: Spectral Flux
% This function extracts the spectral flux for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specFlux:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

[m, n] = size(xb); %m = blockSize, n = numBlocks
specFlux = zeros(1, n);

for i = 1 : n
    w = xb(:,i) .* myHann(m);
%     temp = xb(:, i);
%     temp2 = abs(fft(temp));
    magnitude = abs(fft(w, 2 * m));
    magnitude = magnitude(1:m);
    
    del = zeros(m, 1);
    del(1) = 0;
    
    for a = 2 : m
        del(a) = magnitude(a) - magnitude(a - 1); 
    end
    
    specFlux(1, i) = sqrt(sum(del.^2))/m; 
    if(isnan(specFlux(1, i)))
        specFlux(1, i) = 0;
    end
end

end