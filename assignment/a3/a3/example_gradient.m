
% Load data
load outliersData.mat

% Plot data
figure(1);
plot(X,y,'b.')
title('Training Data');
hold on

% Fit least-squares estimator
model = leastSquaresGradient(X,y);

% fit with robust regression gradient
epsilon = 0.1;
model_new = robustRegressionGradient(X,y,epsilon);


% Draw model prediction
Xsample = [min(X):.01:max(X)]';
%yHat = model.predict(model,Xsample);
yHat_new = model.predict(model_new,Xsample);

%plot(Xsample,yHat,'g-');
plot(Xsample,yHat_new,'r-');