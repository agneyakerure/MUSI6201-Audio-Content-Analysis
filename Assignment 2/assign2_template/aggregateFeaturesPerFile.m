function [aggregatedFeatureVec] = aggregateFeaturesPerFile(featureValues)

%% Aggregates the values in featureValues and returns the mean and standard
% deviation, hence given 2 aggregated features per blocked feature per file.
% Input:
%   featureValues: 5 x numBlocks float array, features returned from extractFeatures.
% Output:
%   aggregatedFeatureVec: 10 x 1 float vector, aggregated feature vector
%                  Contains the mean and std of each in feature featureValues.

% Write your code below:

aggregatedFeatureVec = zeros(10, 1);
fsize = size(featureValues);

for i = 1 : fsize
    
   mean_index = (i*2) - 1;
   stddev_index = i * 2;
   
   aggregatedFeatureVec(mean_index) = mean(featureValues(i, :));
   aggregatedFeatureVec(stddev_index) = std(featureValues(i, :));
end

end