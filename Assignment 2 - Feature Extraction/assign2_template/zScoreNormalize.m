function [normFeatureMatrix] = zScoreNormalize(featureMatrix)

%% Performs z-score normalization over the input featureMatrix
%
% Inputs:
%   featureMatrix:  f x N float matrix, where f is the number of features (10 in this case)
%                   and N is the number of audio files in the directory.
%
% Outputs:
%   normFeatureMatrix:  f x N float matrix, where f is the number of features (10 in this case)
%                   and N is the number of audio files in the directory.

% Write your code below

[m, n] = size(featureMatrix);
normFeatureMatrix = zeros(m, n);

for i = 1 : m
    f = featureMatrix(i,:);
    fMean = mean(f);
    fstd = std(f);
    normFeatureMatrix(i,:) = featureMatrix(i,:) - fMean;
    normFeatureMatrix(i,:) = normFeatureMatrix(i,:) ./ fstd;
end

end