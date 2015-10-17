function [model] = weightedLeastSquares(x,y,z)

% Solve least squares problem
w = ((z*x)'*(z*x))\x'*y;

model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xtest)
w = model.w;
yhat = Xtest*w;
end