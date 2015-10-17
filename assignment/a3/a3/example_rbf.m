
% Load data
warning off all
close all
clear all
load nonLinearData.mat
[n,d] = size(X);

% Plotting Code
plot(X,y,'b.');hold on
plot(Xtest,ytest,'g.');
xl = xlim;
yl = ylim;
Xvals = [xl(1):.1:xl(2)]';
pause(.1)

% Display result of fitting with RBF kernel
% Train on the first half of the
% training data and test on the second half of the training data (the `validation' set).
X_train = X(1:50,:);
y_train = y(1:50,:);
X_validate = X(51:100,:);
y_validate = y(51:100,:);
error = 1;

for sigma = 2.^[3:-1:-4]
    
    for lambda = 2.^[2:-1:-12]
        %% Train on X, test on Xtest
        model = leastSquaresRBF(X_train,y_train,sigma,lambda);
        yhat = model.predict(model,X_validate);
        fprintf('Test error with sigma = %f, lambda = %f is %f\n',sigma,lambda,mean(abs(yhat-y_validate)));
        % find the parameter with minimum error
        if (mean(abs(yhat-y_validate)) < error)
            s = sigma;
            l = lambda;
            error = mean(abs(yhat-y_validate));
        end    
        %% Plotting Code
        figure(1);clf;
        plot(X,y,'b.');hold on
        plot(Xtest,ytest,'g.');
        yvals = model.predict(model,Xvals);
        plot(Xvals,yvals,'r-');
        legend({'Train','Test'});
        ylim(yl);
        title(sprintf('RBF Basis (sigma = %f)',sigma));
        pause(.25)
    end    
end

fprintf('Test error with sigma = %f, lambda = %f is %f\n',s,l,error);

% After finding the optimal sigma and lambda, 
% sigma = 1.000000, lambda = 0.001953
% We train on the full training set and test on the test set

model = leastSquaresRBF(X,y,1,0.001953);
yhat = model.predict(model,Xtest);
fprintf('Test error with sigma = %f, lambda = %f is %f\n',1,0.001953,mean(abs(yhat-ytest)));
        

