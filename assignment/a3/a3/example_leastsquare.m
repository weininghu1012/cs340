
% Load data
load basisData.mat

% Plot data
figure;
i = 0;
for i = 0:8
    subplot(3,3,i+1)
    plot(X,y,'b.')
    title(sprintf('degree = %d',i))
    hold on

    % Fit least-squares estimator
    model = leastSquaresBasis(X,y,i);

    % Draw model prediction
    Xsample = [min(X):.1:max(X)]';
    yHat = model.predict(model,Xsample);
    plot(Xsample,yHat,'g-');
end    
