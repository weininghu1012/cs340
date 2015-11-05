
%% Load data, standardize columns, and add bias
load logisticData.mat
[n,d] = size(X);
t = size(Xvalidate,1);

% Standardize columns
[X,mu,sigma] = standardizeCols(X);

% Perform the *same* transformation of the test data
Xvalidate = standardizeCols(Xvalidate,mu,sigma);

% Add bias
X = [ones(n,1) X];
Xvalidate = [ones(t,1) Xvalidate];

%% Fit logistic regression model,
% then report number of non-zeroes and validation error
lambda = 1;
model = logRegL2(X,y,lambda);
    
numberOfNonZero = nnz(model.w);

yhat = model.predict(model,X);
trainingError = sum(yhat ~= y)/t;

yhat = model.predict(model,Xvalidate);
validationError = sum(yhat ~= yvalidate)/t;