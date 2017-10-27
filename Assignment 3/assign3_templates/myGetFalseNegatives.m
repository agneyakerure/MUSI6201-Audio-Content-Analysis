function [pfn] = myGetFalseNegatives(estimation, annotation)

%% Computes the percentage of false negatives
% Input:
%   estimation: (numBlocks x 1) float vector, estimated pitch (Hz) per block   
%   annotation: (numBlocks x 1) float vector, annotated pitch (Hz) per block
% Output:
% 	pfn:		float, percentage of false negatives


%% Please insert your code here

wrongs = 0;
negatives = 0;
len = length(estimation);
for i = 1 : len
    if annotation(i) == 0
       negatives = negatives + 1;
       if estimation(i) ~= 0
           wrongs = wrongs + 1;
       end
    end
end

pfn = (wrongs / negatives) * 100.00;

end