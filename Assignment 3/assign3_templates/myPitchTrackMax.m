function [f0, timeInSec] = myPitchTrackMax(x, blockSize, hopSize, fs)

%% Blockwise Pitch Tracking based on Maximum Spectrum approach
% Input:
%   x:          (N x 1) float vector, input signal
%   blockSize:  int, block size of the blockwise process
%   hopSize:    int, hop size of the blockwise process
%   fs:         float, sample rate in Hz
% Output:
%   f0:         (numBlocks x 1) float vector, detected pitch (Hz) per block
%   timeInSec:  (numBlocks x 1) float vector, time stamp (sec) of each block


%% Please write your code here. Follow the steps as per the comments

[xb, timeInSec] = myBlockAudio(x, blockSize, hopSize, fs);
[spec, binFreqs] = myComputeSpectrogram(xb, fs, blockSize);
spec_size = size(spec);
numBlocks = spec_size(2);
f0 = zeros(numBlocks, 1);

for i = 1 : numBlocks
    [pks, ind] = findpeaks(spec(:,i));
    len = length(pks);
    max = -1;
    maxInd = -1;
    for peakInd = 1 : len
        if maxInd == -1
            max = pks(peakInd);
            maxInd = ind(peakInd);
        else
            if pks(peakInd) > max
                max = pks(peakInd);
                maxInd = ind(peakInd);
            end
        end
    end
    if(max == -1)
        f0(i) = 0;
    else
        f0(i) = binFreqs(maxInd);
    end
end

end