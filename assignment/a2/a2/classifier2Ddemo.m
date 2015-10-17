% Load dataset
load binary.mat

[N,D] = size(X);

% Fit decision tree
model = decisionTree_InfoGain(X,y,1);

% Compute training error
yhat = model.predict(model,X);
trainingError = sum(yhat ~= y)/N;

% Show data and decision boundaries
classifier2Dplot(X,y,model);


% for knn
% Fit decision tree
model_knn = knn(X,y,5);

% Compute training error
yhat_knn = model_knn.predict(model_knn,X);
trainingError_knn = sum(yhat_knn ~= y)/N;

% Show data and decision boundaries
classifier2Dplot(X,y,model_knn);


