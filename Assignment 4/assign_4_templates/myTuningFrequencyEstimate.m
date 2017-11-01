function [tf] = myTuningFrequencyEstimate(x, blockSize, hopSize, fs)

%% Estimate the tuning frequency of an input music signal
% Input:
%   x:          N*1 float vector, input signal
%   blockSize:  int, size of each block
%   hopSize:    int, hop size
%   fs:         float, sampling rate in Hz
% Output:
%   tf:         deviation of tuning frequency from A440 equally tempered
%               scale in cents.

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

%% Please write your code here

[xb, ~] = myBlockAudio(x, blockSize, hopSize, fs);
aFreq = 440;
[~, n] = size(xb);

window = repmat(hann(blockSize),1,n);
xb = xb.*window;

dev = zeros(20 * n,1);
for i = 1 : n
    x_block_sig = xb(:,i);
    specPeaks = mySpectralPeaks(x_block_sig);
    specPeaks_HZ = specPeaks./blockSize*fs/2;
    midi = 69 + 12 * log2(specPeaks_HZ/aFreq);
    dev((i-1)*20+1:i*20) = (round(midi)-midi)*100;
end

tf = mode(dev);

end