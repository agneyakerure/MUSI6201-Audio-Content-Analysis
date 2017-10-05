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

[numBlocks, blockSize] = size(xb);
windowMat = hann(blockSize);
windowMat = windowMat * ones(1,numBlocks);
binFreqs = (fs/(fftLength))*[1:(floor(fftLength / 2) + 1)];
X = zeros(floor(fftLength / 2) + 1, numBlocks);

% compute magnitude spectrogram 
X = fft((xb' .* windowMat), fftLength); % compute fft after windowing
%X = X(1:blockSize/2, :); % discard redundant part of the fft
X = abs(X); % take magnitude

X = X'; % tranpose matrix so that it is as per the input configuration
end