function rms = myRMS(xb)

%% Audio Feature: Root Mean Square energy
% This function extracts the RMS energy for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   maxEnv:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

[m, n] = size(xb); %m = blockSize, n = numBlocks
rms = zeros(1, n);

for i = 1 : n
    w = xb(:,i) .* myHann(m);
%     temp = xb(:, i);
%     temp2 = abs(fft(temp));
    magnitude = abs(fft(w, 2 * m));
    magnitude = magnitude(1:m);
    
    energy = magnitude.^2;
    mean = (1/m).*sum(energy);
    
    rms(1, i) = sqrt(mean);
    
end


end