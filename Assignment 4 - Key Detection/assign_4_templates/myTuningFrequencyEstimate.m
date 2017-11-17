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
[~, n] = size(xb);

win = repmat(hann(blockSize),1,n);
xb = xb.*win;

deviation = zeros(n,1);

for i = 1 : n
    
    blockedSignal = xb(:,i);
    spec = mySpectralPeaks(blockedSignal);
    specHz = (spec-1)/(blockSize-1)*fs;
    midi = 69 + 12 * log2(specHz/440);
    
    deviation(i) = round(mean(midi - round(midi))*100);
    
end

tf = mode(deviation);

end