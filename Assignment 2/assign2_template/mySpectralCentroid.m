function [specCentroid] = mySpectralCentroid(xb, fs)

%% Audio Feature: Spectral Centroid
% This function extracts the spectral centroid for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specCentroid:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

[m, n] = size(xb); %m = blockSize, n = numBlocks
specCentroid = zeros(1, n);

freq = ((fs/(2*m))*(1:m))';

for i = 1 : n
    w = xb(:,i) .* myHann(m);
%     temp = xb(:, i);
%     temp2 = abs(fft(temp));
    magnitude = abs(fft(w, 2 * m));
    magnitude = magnitude(1:m);
    
    specCentroid(1, i) = sum(freq .* magnitude)/sum(magnitude); 
    if(isnan(specCentroid(1, i)))
        specCentroid(1, i) = 0;
    end
end

end