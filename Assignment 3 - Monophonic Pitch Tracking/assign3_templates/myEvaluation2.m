function [errCentRms, pfp, pfn] = myEvaluation2(estimation, annotation)

%% Evaluates the performance of a pitch tracker
% Input:
%   estimation: (numBlocks x 1) float vector, estimated pitch (Hz) per block   
%   annotation: (numBlocks x 1) float vector, annotated pitch (Hz) per block
% Output:
%   errCentRms: float, rms of the difference between estInMidi and annInMidi 
%   pfp:		float, percentage of false positives (unvoiced blocks classified as voiced)
%	pfn:		float, percentage of false negatives (voiced blocks classified as unvoiced)
% Note: 
%   1) please exclude the blocks when ann(i) == 0

[m1,n1] = size(estimation);
if (n1>1)
    error('illegal estimation vector ');
end
[m2,n2] = size(annotation);
if (n2>1)
    error('illegal annotation vector');
end
if (m1~=m2)
   error('size of estimation and annotation do not match'); 
end

%% Please write your code here, Follow the steps as per the comments
diff = zeros(length(estimation), 1);
len = length(estimation);
ctr = 0;

for n = 1 : len
   if(annotation(n) ~= 0)
      eMIDI = myFreq2MidiPitch(estimation(n));
      aMIDI = myFreq2MidiPitch(annotation(n));
      diff = 100 * abs(aMIDI - eMIDI);
      diff(n) = diff;
      ctr = ctr + 1;
   end
end

diff2 = diff.^2;
diffSum = sum(diff2);
div = diffSum / ctr;
errCentRms = sqrt(div);
pfp = myGetFalsePositives(estimation, annotation);
pfn = myGetFalseNegatives(estimation, annotation);

end