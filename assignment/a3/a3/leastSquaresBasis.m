function [model] = leastSquaresBasis(x,y,degree)
[N,D] = size(x);
xpoly = zeros(N,(degree+1));
for i = 0:degree
    xpoly(:,(i+1)) = x.^(i);
end
w = (xpoly'*xpoly)\xpoly'*y;
model.w = w;
model.predict = @predict;
model.degree = degree;
end


function [yhat] = predict(model,Xtest)
degree = model.degree;
[r,c] = size(Xtest);
xtestpoly = zeros(r,(degree+1));
for i = 0:degree
    xtestpoly(:,(i+1)) = Xtest.^(i);
end
w = model.w;
yhat = xtestpoly*w;
end