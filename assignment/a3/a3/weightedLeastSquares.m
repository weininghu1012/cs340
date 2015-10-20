function [model] = weightedLeastSquares(x,y,z)

% Solve least squares problem
% in our question, the z is a diagonal matrix where
%z = ones(1,500);
%z(1:400) = 1;
%z(401:500) = 0.1;
%z = diag(z);
% 
w = ((x'*z*x))\(x'*z*y);
model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xtest)
w = model.w;
yhat = Xtest*w;
end