% Load data
load basisData.mat

errorTrain = zeros(1,21);
errorValidate = zeros(1,21);
errorAvg = zeros(1,21);

% Split the data into training set and validation set
% training
X_train = X(1:250,:);
y_train = y(1:250,:);

%validation
X_validate = X(251:500,:);
y_validate = y(251:500,:);



for degree = 0:20
    model = leastSquaresBasis(X_train,y_train,degree);
    yhat_train = model.predict(model,X_train);
    errorTrain(degree+1) = (yhat_train-y_train)'*(yhat_train-y_train)/250;
    yhat_validate = model.predict(model,X_validate);
    errorValidate(degree+1) = (yhat_validate-y_validate)'*(yhat_validate-y_validate)/250;
    errorAvg(degree+1) = (errorTrain(degree+1)+errorValidate(degree+1))/2;
    
    fprintf('At degree = %d,training error = %10.5f,validation error = %10.5f, average error = %10.5f',degree,errorTrain(degree+1),errorValidate(degree+1),errorAvg(degree+1));
    fprintf('\n')
end    