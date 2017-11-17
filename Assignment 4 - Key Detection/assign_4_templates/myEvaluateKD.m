function [accuracy] = myEvaluateKD(pathToAudio, pathToGT)

%% Evaluates the tuning frequency estimation algorithm
% Input:
%   pathToAudio:    string, path to audio files
%   pathToGT:       string, path to ground truth text files
% Output:
%   avgDeviation:   accuracy of key detection algorithm for the audio files
%                   in the audio directory

%% Please write your code here

blockSize = 4096;
hopSize = 2048;
fs = 44100;

audioFiles = dir(strcat(pathToAudio,'*.au'));
gtFiles = dir(strcat(pathToGT,'*.txt'));

n = length(audioFiles);

numTune = 0;
numUntune = 0;

major = char('A','A#','B','C','C#','D','D#','E','F','F#','G','G#');
minor = char('a','a#','b','c','c#','d','d#','e','f','f#','g','g#');

for i = 1 : n
   test_audio = audioread(strcat(pathToAudio, audioFiles(i).name));
   gt = textread(strcat(pathToGT, gtFiles(i).name));
   
   estTune = myKeyDetection(test_audio, blockSize, hopSize, fs, true);
   estUntune = myKeyDetection(test_audio, blockSize, hopSize, fs, false);
   
   if gt > 0
       if (gt + 1) > 12
           GT = strcat(minor(gt-11,:),' min');
       else
           GT = strcat(major(gt+1,:),' Maj');
       end
       
       disp(GT);
       disp(estTune);
       disp(estUntune);
       
       if strcmp(GT, estTune)
           numTune = numTune + 1;
       end
       
       if strcmp(GT, estUntune)
           numUntune = numUntune + 1;
       end
       
   end
   
end

accuracy = [numTune/length(audioFiles);numUntune/length(audioFiles)]

end