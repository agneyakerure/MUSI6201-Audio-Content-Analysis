function [f0] = myComputeF0FromHPS(X, fs, order)

%% Computes the fundamental frequency f0 from a spectrogram using HPS
% Input:
%	X:			(fftLength / 2 x numBlocks) float matrix, mag. spectrogram
%	fs:			float, sampling rate in Hz
% 	order:		int, specifying the order for computing HPS
% Output:
% 	f0:			(numBlocks x 1) float vector, fundamental frequency of all blocks

%% Please insert your code here

[blockSize, numBlocks] = size(X);
f0 = zeros(numBlocks, 1);
binFreqs = (fs/(blockSize))*[1:blockSize];
for i = 1 : numBlocks
    spec = X(:,i);
    spec = spec .* spec;
    spec2 = spec;
    for j = 2 : order
        ds = downsample(spec2, j);
        spec(1:length(ds)) = spec(1:length(ds)) .* ds;
    end
    [pks, locs] = findpeaks(spec);
    len = length(pks);
    max = -1;
    maxIndex = -1;
    for k = 1 : len
        if maxIndex == -1
            max = pks(k);
            maxIndex = locs(k);
        else
            if pks(k) > max
                max = pks(k);
                maxIndex = locs(k);
            end
        end
    end
    if(max == -1)
        f0(i) = 0;
    else
        f0(i) = binFreqs(maxIndex);
    end
end

end
