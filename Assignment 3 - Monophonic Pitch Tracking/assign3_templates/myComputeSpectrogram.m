function [X, binFreqs] = myComputeSpectrogram(xb, fs, fftLength)

%% Computes the magnitude spectrogram from a matrix of audio blocks
% Input:
%	xb:			(blockSize x numBlocks) float matrix, blocks of audio
%	fs:			float, sampling rate in Hz
% 	fftLength:	int, usually power of 2, length of the fft
% Output:
% 	X:			(floor(fftLength / 2) + 1 x numBlocks) float matrix, magnitude spectrogram 
% 	binFreqs:	(floor(fftLength / 2) + 1 x 1) float vector, center frequencies(Hz) of all bins

%% Please insert your code here
[blockSize, numBlocks] = size(xb);
binFreqs = (fs/(fftLength))*(1:(floor(fftLength / 2) + 1));

X = zeros(floor(fftLength / 2) + 1, numBlocks);

for i = 1 : numBlocks
    window = xb(:,i) .* hann(blockSize);
    num = abs(fft(window, fftLength));
    num = num(1:(floor(fftLength) / 2) + 1);
    X(:,i) = num;
end

end