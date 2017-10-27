function [rmsDb] = myComputeRmsDb(xb) 

%% Computes the rms amplitude of each block of the input blocked audio 
% Input:
%	xb: 	(blockSize x numBlocks) float matrix, blocked audio 
% Output:
%	rmsDb: 	(numBlocks x 1) float vector, rms amplitude of each block in decibels	


%% Please insert your code here

[blockSize, numBlocks] = size(xb);
rmsDb = zeros(numBlocks, 1);

for i = 1 : numBlocks
    block = xb(:, i);
    total = sum(block .* block);
    rms = sqrt(total/blockSize);
    rmsDb(i) = 20*(log(rms));
end

end