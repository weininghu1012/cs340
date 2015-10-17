% split 2-fold on the traning data alone

clear all
load DTdata.mat

[N,D] = size(X);
T = length(ytest);
depth = (1:15);
errorTrain_first = zeros(1,15);
errorTrain_second = zeros(1,15);
erroravg = zeros(1,15)
first_x = X(1:2500,:)
second_x = X(2501:5000,:)

first_y = y(1:2500,:)
second_y = y(2501:5000,:)

for i = 1:15;
    % we train on the first fold and test on the second fold
    model_first = decisionTree_InfoGain(first_x,first_y,depth(i));
    yhat = model_first.predictFunc(model_first,second_x);
    errorTrain_first(i) = sum(yhat ~= second_y)/2500
    
    % we train on the second fold and test on the first fold
    model_second = decisionTree_InfoGain(second_x,second_y,depth(i));
    yhat = model_second.predictFunc(model_second,first_x);
    errorTrain_second(i) = sum(yhat ~= first_y)/T
    
    % we record the average
    erroravg(i) = 0.5*(errorTrain_first(i)+errorTrain_second(i))
end

figure
plot(depth,erroravg,'g')

