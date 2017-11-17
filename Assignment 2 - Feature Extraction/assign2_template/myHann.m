function [w] = myHann(blockSize)

w = zeros(blockSize, 1);

for n = 1 : blockSize
    w(n) = (1 - cos((2 * pi *(n - 1))/(blockSize - 1)))/2;
end

end