function xb = blockAudio(x, blockSize, hopSize)

    n = length(x);
    numBlocks = fix(n/hopSize);
    padding = mod(n, hopSize);
    x = [x;zeros((hopSize-padding),1)];
    xb = zeros(blockSize, numBlocks);
    for i=1 : numBlocks
        xb(:,i) = x((i-1)*hopSize+1:(i-1)*hopSize+blockSize);
    end
    xb = xb';
end