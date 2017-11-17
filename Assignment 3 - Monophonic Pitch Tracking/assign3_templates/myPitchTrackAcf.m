function [f0, timeInSec] = myPitchTrackAcf(x, blockSize, hopSize, fs)

%% Blockwise Pitch Tracking based on ACF
% Input:
%   x:          (N x 1) float vector, input signal
%   blockSize:  int, block size of the blockwise process
%   hopSize:    int, hop size of the blockwise process
%   fs:         float, sample rate in Hz
% Output:
%   f0:         (numBlocks x 1) float vector, detected pitch (Hz) per block
%   timeInSec:  (numBlocks x 1) float vector, time stamp (sec) of each block

% Check input dimensions 
[~,n] = size(x);
if (n>1)
    error('illegal input signal');
end
[m,n] = size(blockSize);
if (m ~= 1 && n ~=1)
    error('illegal blockSize');
end
[m,n] = size(hopSize);
if (m ~= 1 && n ~=1)
    error('illegal hopSize');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('illegal fs');
end

%% Please write your code here. Follow the steps as per the comments
[xb, timeInSec] = myBlockAudio(x, blockSize, hopSize, fs);
len = size(xb, 2);
f0 = zeros(len, 1);

for n = 1 : len
	rb = myCompAcf (xb(:, n), 1);
	f0(n) = myGetF0FromAcf(rb, fs);
end

end