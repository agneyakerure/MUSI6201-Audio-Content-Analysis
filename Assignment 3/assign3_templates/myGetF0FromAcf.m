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
der = diff(acfVector);
der2 = diff(der);
der = [0; der];
der2 = [0; 0; der2];
len = length(der);
peak = [];

for i = 2 : len
    if der(i) * der(i-1) <= 0
        if der2(i) < 0
            peak = [peak; i - 1];
       end
    end 
end

if isempty(peak)
    f0 = 0;
    return;
end

[~, index] = max(acfVector(peak));
index = peak(index);
f0 = fs / (index - 1);

end
