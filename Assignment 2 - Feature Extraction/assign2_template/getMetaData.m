function [featureMatrix] = getMetaData(path, blockSize, hopSize)

%% Iterates over all files in a folder, computes the aggregated features
% for each file and returns a feature matrix for all files.
%
% Inputs:
%   path:       string, path to directory that contains only audio files, for which
%               features are to be extracted
%   blockSize:  integer, blockSize to be used for blocking of audio files
%   hopSize:    integet, hopSize to be used for blocking of audio files
%
% Outputs:
%   featureMatrix:  f x N float matrix, where f is the number of features (10 in this case)
%                   and N is the number of audio files in the directory.

% Write your code below

sounds = dir(path);
num = length(sounds) - 2;
featureMatrix = zeros(10, num);

for i = 1 : length(sounds)
    
    file = sounds(i);
    
    if(~strcmp(file.name, '.') && ~strcmp(file.name, '..'))
       [x, fs] = audioread(fullfile(file.folder, file.name));
       featureVector = extractFeatures(x, blockSize, hopSize, fs);
       featureVector = aggregateFeaturesPerFile(featureVector);
       featureMatrix(:, i - 2) = featureVector;
    end
    
end

end