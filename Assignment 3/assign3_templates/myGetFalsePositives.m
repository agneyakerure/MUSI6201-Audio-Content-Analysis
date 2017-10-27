function [pfp] = myGetFalsePositives(estimation, annotation)

%% Computes the percentage of false positives
% Input:
%   estimation: (numBlocks x 1) float vector, estimated pitch (Hz) per block   
%   annotation: (numBlocks x 1) float vector, annotated pitch (Hz) per block
% Output:
% 	pfp:		float, percentage of false positives


%% Please insert your code here

positives = 0;
wrongs = 0;
len = length(estimation);

for i = 1 : len
    if annotation(i) ~= 0
       positives = positives + 1;
       if estimation(i) == 0
           wrongs = wrongs + 1;
       end
    end
end

pfp = (wrongs / positives) * 100.00;

end