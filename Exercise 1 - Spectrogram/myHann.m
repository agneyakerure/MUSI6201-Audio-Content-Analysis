function y = myHann(blockSize)

% create matrix to store indices
y = (0:blockSize-1)';
% compute the values using sin^2 formula 
y = power(sin(pi*y/(blockSize-1)),2);

end