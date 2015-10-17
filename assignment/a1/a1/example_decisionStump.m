% Load X and y variable
load newsgroups.mat
[N,D] = size(X);

% Fit decision stump
model = decisionStump(X,y);
model2 = decisionTree(X,y,2);

% Evaluate training error
yhat = model.predictFunc(model,X);
error = sum(yhat ~= y)/N;
fprintf('Error with decision stump: %.2f\n',error);
model2.splitModel
right = model2.subModel1
left = model2.subModel0

% for depth with 10
model_10 = decisionTree(X,y,10);
yhat_10 = model_10.predictFunc(model_10,X);
error_10 = sum(yhat_10~=y)/N;
fprintf('Error with decision stump: %.2f\n',error_10);