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

audioFiles = dir(strcat(pathToAudio,'*.au'));
gtFiles = dir(strcat(pathToGT,'*.txt'));

major = char('A','A#','B','C','C#','D','D#','E','F','F#','G','G#');
minor = char('a','a#','b','c','c#','d','d#','e','f','f#','g','g#');

num1 = 0;
num2 = 0;

for i = 1 : length(audioFiles)
   audio = audioread(strcat(pathToAudio, audioFiles(i).name));
   gt = textread(strcat(pathToGT, gtFiles(i).name));
   keyTrue = myKeyDetection(audio, blockSize, hopSize, 44100, true);
   
   keyFalse = myKeyDetection(audio, blockSize, hopSize, 44100, false);
   if gt > 0
       if (gt + 1) > 12
           gtChar = strcat(minor(gt-11,:),' min');
       else
           gtChar = strcat(major(gt+1,:),'Maj');
       end

       if strcmp(gtChar, keyTrue)
           num1 = num1 + 1;
       end
       if strcmp(gtChar, keyFalse)
           num2 = num2 + 1;
       end
   end
end

accuracy = [num1/length(audioFiles);num2/length(audioFiles)];

end