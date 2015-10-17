function [model] = simpleLeastSquares(X,y)

% Solve least squares problem
% add extra column with ones
[row,col] = size(X);
b = ones(row,1);
X = [X b];

w = (X'*X)\X'*y;

model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xtest)
[r,c] = size(Xtest);
b0 = ones(r,1);
Xtest = [Xtest b0];
w = model.w;
yhat = Xtest*w;
end