function [avg_accuracy, fold_accuracies, conf_mat] = myCrossValidation(data, labels, K, num_folds)

%% Implements your n-fold cross validation scheme
% 
% Input:
%   data:               num_features x num_data_points matrix, containing the data features
%   labels:             1 x num_data_points matrix, containing the data labels
%   K:                  int, parameter for the kNN classifier
%   num_folds:          int, parameter for the number of folds for cross validation
% Output:
%   avg_accuracy:       float, average accuracy for the all the folds 
%   fold_accuracies:    1 x num_folds vector, accuracies for the all the n-folds
%   conf_mat:           num_classes x num_classes matrix, cumulative confusion matrix across all n-folds
% Hint: 
%   Here you should first divide your data into n-folds. The ideal of doing that would be to
%   first randomly shuffle datapoints within each class and then divide the data but for this 
%   assignment, it is OK if you don't shuffle the data. You would need to call myKnn() n times
%   and compute the accuracy and confusion mat for each fold. Writing a small function which 
%   takes the predicted labels and actual labels as arguments and returns the accuracy and 
%   confusion mat might be useful. 

    
%% Add your code here
[~, n] = size(data);
idx = randperm(n);
shuffData = data(:,idx);
shuffLab = labels(:,idx);
foldLen = floor(n / num_folds);

conf_mat = zeros(5, 5);
fold_accuracies = zeros(1, num_folds);

for i = 1 : num_folds
    
   testData = shuffData(:,(foldLen*(i-1) + 1) : foldLen*i);
   trainData = [shuffData(:, 1 : foldLen * (i-1)), shuffData(:, (foldLen*i+1):end)];
   trainLabels = [shuffLab(1:foldLen * (i - 1)), shuffLab(:, (foldLen*i+1):end)];
   testLabels = shuffLab((foldLen*(i-1) + 1):foldLen*i);
   est_class = myKnn(testData, trainData, trainLabels, K);
   fold_confmat = confusionmat(est_class, testLabels);
   accurate = length(testLabels(testLabels == est_class));
   tmp_accuracy = accurate / length(testLabels);
   conf_mat = conf_mat + fold_confmat;
   fold_accuracies(i) = tmp_accuracy;
   
end

avg_accuracy = mean(fold_accuracies);

end