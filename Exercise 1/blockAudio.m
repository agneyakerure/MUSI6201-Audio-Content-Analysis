function xb = blockAudio(x, blockSize, hopSize)
    % get signal length
    signal_length = length(x);
    
    % compute number of blocks in audio
    num_blocks = ceil(signal_length/hopSize);
    
    % zero pad incoming signal appropriately
    zero_pad = num_blocks*hopSize + blockSize - signal_length;
    x = [x; zeros(zero_pad, 1)];
    
    % split signal into blocks
    xb = zeros(num_blocks, blockSize); % initialize output matrix
    for i = 1:num_blocks
        xb(i,:) = x((i-1)*hopSize+1:(i-1)*hopSize + blockSize);
    end
end