%% Load data
load movies.mat



k = 10;
model = recommendSVD_stochastic(X,y,k);
yhat = model.predict(model,Xvalidate);
err = mean(abs(yhat - yvalidate));

fprintf('Average absolute error by using stochastic gradient descent: %f\n',err);
