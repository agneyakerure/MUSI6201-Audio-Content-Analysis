function pitch = myPitchDetect(inputVector, samplingFreq)
    
    % auto corr
    n = length(inputVector);
    r = zeros(n, 1);
    
    counter = n;
    for i = 1 : n
        r(i) = sum(inputVector(i : end) .* inputVector(1 : counter));
        counter = counter - 1;
    end
    
    %normalization
    r = r ./ max(r);
    
    %find peaks
    [pks, locs] = findpeaks(r);
    [~, ind1] = max(pks);
    pitch = samplingFreq / locs(ind1);
    
end