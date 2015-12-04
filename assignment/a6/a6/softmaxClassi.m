function [model] = softmaxClassier(X,y)
% Classification using one-vs-all least squares

% Compute sizes
[n,d] = size(X);
k = max(y);

W = zeros(d,k); % Each column is a classifier
W(:) = findMin(@SoftmaxlossFunction,W(:),400,1,X,yc);

model.W = W;
model.predict = @predict;
end


function [loss,grad] = SoftmaxlossFunction(w,X,y,k)
W = reshape(w,[p k]);

% compute loss
loss = 


end

function [yhat] = predict(model,X)
W = model.W;
    [~,yhat] = max(X*W,[],2);
end