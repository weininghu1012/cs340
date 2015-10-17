
% Load data
load outliersData.mat

% Plot data
figure(1);
plot(X,y,'b.')
title('Training Data');
hold on

% Fit least-squares estimator
model = leastSquares(X,y);
z = ones(1,500);
z(1:400) = 1;
z(401:500) = 0.1;
model_new = weightedLeastSquares(X,y,z);

% Draw model prediction
Xsample = [min(X):.01:max(X)]';
yHat = model.predict(model,Xsample);
yHat_new = model_new.predict(model_new,Xsample);
plot(Xsample,yHat,'g-');
plot(Xsample,yHat_new,'r-');
