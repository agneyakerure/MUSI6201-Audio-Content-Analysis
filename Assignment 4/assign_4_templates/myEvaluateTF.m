function [avgDeviation] = myEvaluateTF(pathToAudio, pathToGT)

%% Evaluates the tuning frequency estimation algorithm
% Input:
%   pathToAudio:    string, path to audio files
%   pathToGT:       string, path to ground truth text files
% Output:
%   avgDeviation:   average absolute deviation (in cents) of tuning frequency
%                   from A440 equally tempered scale for all the files in audio
%                   directory.

%% Please write your code here

blockSize = 4096;
hopSize = 2048;

audioFiles = dir(strcat(pathToAudio,'*.wav'));
gtFiles = dir(strcat(pathToGT,'*.txt'));
totalDeviation = 0;
for i = 1 : length(audioFiles)
   aud = audioread(strcat(pathToAudio,audioFiles(i).name));
   gt = textread(strcat(pathToGT, gtFiles(i).name));
   tf = myTuningFrequencyEstimate(aud, blockSize, hopSize, 44100);
   totalDeviation = totalDeviation + abs(tf - gt);
end

avgDeviation = totalDeviation / length(audioFiles);

end