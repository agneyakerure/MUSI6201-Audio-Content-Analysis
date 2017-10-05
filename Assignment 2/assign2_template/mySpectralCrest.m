function [specCrest] = mySpectralCrest(xb)

%% Audio Feature: Spectral Crest
% This function extracts the spectral crest for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specCrest:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

[m, n] = size(xb); %m = blockSize, n = numBlocks
specCrest = zeros(1, n);

for i = 1 : n
    w = xb(:,i) .* myHann(m);
%     temp = xb(:, i);
%     temp2 = abs(fft(temp));
    magnitude = abs(fft(w, 2 * m));
    magnitude = magnitude(1:m);
    
    specCrest(1, i) = max(magnitude) / sum(magnitude); 
    if(isnan(specCrest(1, i)))
        specCrest(1, i) = 0;
    end
end

end