function [zcr] = myZCR(xb)

%% Audio Feature: Zero-Crossing Rate
% This function extracts the zero-crossing rate for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specCrest:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

[m, n] = size(xb); %m = blockSize, n = numBlocks
zcr = zeros(1, n);

for i = 1 : n
    block = xb(:,i);
    zerocross = zeros(m, 1);
    zerocross(1) = 0;
    
    for j = 2 : m
        zerocross(j) = abs(sign(block(j)) - sign(block(j - 1)));
    end
    
    tot = sum(zerocross);
    
    zcr(1, i) = (1/(2*m))*tot;
end

end