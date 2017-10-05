function Xb = compMagSpectrum(xb)

% get input dimensions
[numBlocks, blockSize] = size(xb);

% create window matrix
windowMat = myHann(blockSize);
windowMat = windowMat * ones(1,numBlocks);

% compute magnitude spectrogram 
Xb = fft(xb' .* windowMat); % compute fft after windowing
Xb = Xb(1:blockSize/2, :); % discard redundant part of the fft
Xb = abs(Xb); % take magnitude

Xb = Xb'; % tranpose matrix so that it is as per the input configuration
end