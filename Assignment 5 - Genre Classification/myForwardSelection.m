function [sfs, accuracy_seq, conf_mat] = myForwardSelection(data, labels, K, num_folds, req_plot) 

%% Implements your forward selection procedure
% 
% Input:
%   data:               num_features x num_data_points matrix, containing the data features
%   labels:             1 x num_data_points matrix, containing the data labels
%   K:                  int, parameter for the kNN classifier
%   num_folds:          int, parameter for the number of folds for cross validation
%   req_plot:           bool, plots the best accuracy v/s iteration number if TRUE, no plots if FALSE
% Output:
%   sel_feature_set:    1 x num_features vector, containing the indices of the selected features 
%   accuracy_seq:       1 x num_features vector, containing the accuracies at each feature selection step
%   conf_mat:           num_classes x num_classes matrix, confusion matrix for the final selected feature set           
% Hint:
%   Here, at iteration of the feature selection process, you need to  run a cross-validation with 
%   num_folds. Use the average accuracy to determine which feature to select. Ideally you should stop
%   the iteration process when the accuracy drops below a certain threshold compared to previous 
%   iteration. But to keep things simple, we ask you to perform iterations till you all exhaust all
%   available features here.           

%% Add your code here
[n, ~] = size(data);
accuracy_seq = zeros(1, n);
feature = (1:n);
len = length(feature);

sfs = [];
iterSFS = [];
bob = 0;
j = 1;

while (~isempty(feature))
    accurracy = 0;
    feature_sel = -1;
    localSFS = [];
    
    for i = 1 : len
        tempSFS = [iterSFS,feature(i)];
        [avgCorr, ~, confMatLoc] =myCrossValidation(data(tempSFS,:), labels, K, num_folds);
        
        if accurracy < avgCorr
            feature_sel = feature(i);
            accurracy = avgCorr;
            localSFS = tempSFS;
            localMaxConfMat = confMatLoc;
        end
        
    end
    
    iterSFS = localSFS;
    %iter
    feature(feature == feature_sel) = [];
    accuracy_seq(j) = accurracy;
    
    if (accurracy > bob)
        bob = accurracy;
        sfs = localSFS;
        conf_mat = localMaxConfMat;
    end
    
    j = j + 1;
end

if req_plot 
    plot(accuracy_seq);
end

end