load('data/data.mat');
load('data/labels.mat');
%% B.2
% param init
numClasses = 5;
K = 3;
num_folds = 3;
bestFeature = 0;
bestAccuracy = 0;
% test feature performance individually
for i = 1 : numClasses
    [avg_accuracy, ~, ~] = myCrossValidation(data(i,:), labels, K, num_folds);
    if avg_accuracy > bestAccuracy
        bestAccuracy = avg_accuracy;
        bestFeature = i;
    end
end
%% C.2
[sel_feature_set,accuracy_seq, confmat] = myForwardSelection(data, labels, K, num_folds, true);
%% D.1
num_folds = 10;
K = [1,3,7];
acc_res = zeros(1,length(K));
confmat_res = zeros(numClass,numClasses*numClasses);
for i = 1 : length(K)
    [avg_accuracy, ~, tmp_confmat] = myCrossValidation(data(sel_feature_set,:), labels, K(i), num_folds);
    acc_res(i) = avg_accuracy;
    confmat_res(:,(numClasses*(i-1)+1):numClasses*i) = tmp_confmat;
end
