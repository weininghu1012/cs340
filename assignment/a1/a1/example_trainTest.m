clear all
load DTdata.mat

[N,D] = size(X);
T = length(ytest);
depth = (1:15);
errorTrain = zeros(1,15);
errorTest = zeros(1,15);

for i = 1:15;
    model = decisionTree_InfoGain(X,y,depth(i));
    yhat = model.predictFunc(model,X);
    errorTrain(i) = sum(yhat ~= y)/N
    yhat = model.predictFunc(model,Xtest);
    errorTest(i) = sum(yhat ~= ytest)/T
end

plot(depth,errorTrain,'r')
title('Depth VS TrainingError')
xlabel('Depth')
ylabel('TrainingError')
figure
plot(depth,errorTest,'b')
title('Depth VS TestingError')
xlabel('Depth')
ylabel('TestingError')



