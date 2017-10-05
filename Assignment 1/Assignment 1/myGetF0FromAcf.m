function [f0] = myGetF0FromAcf(acfVector, fs)

%% Computes the pitch for a block of audio from the ACF vector
% Input:
%   acfVector:  (blockSize x 1) float vector, ACF of a block
%   fs:         float, sampling rate in Hz
% Output:
%   f0:         float, fundamental frequency of the block in Hz  

% check input dimensions
[~, n] = size(acfVector);
if (n>1)
    error('illegal input acfVector');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('illegal fs');
end


%% Please insert your code here

%find peaks
% [pks, locs] = findpeaks(acfVector);
% [~, ind1] = max(pks);
% f0 = fs / locs(ind1);
min1 = floor(fs/5000);
max1 = floor(fs/100);
[~, ind] = max(acfVector(min1:max1));
ind = ind + min1;
f0 = fs/ind;

end
