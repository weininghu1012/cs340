function [model] = softmaxClassifier(X,y)
% Classification using one-vs-all least squares

% Compute sizes
[n,p] = size(X);
k = max(y);

W = zeros(p,k); % Each column is a classifier
maxFunEvals=400;
verbose=1;
W(:) = findMin(@softLoss,W(:),maxFunEvals,verbose,X,y,k);

model.W = W;
model.predict = @predict;
end

function [f,g]=softLoss(w,X,y,k)
[n,d] = size(X);
W = reshape(w, [d k]);

f=sum(-sum(X.*W(:,y).',2)+log(sum(exp(X*W),2)));

g = zeros(d,k);
for c = 1:k
    for j =1:d
        gval=0;
        for i=1:n
            if (y(i)==c)
                indi=1;
            else indi=0;
            end
            minus=-X(i,j)*indi;
            den=sum(exp(X*W),2);
            nom=exp(X(i,:)*W(:,c))*X(i,j);
            gval=gval+sum(minus+nom/den(i));
        end
        g(j,c)=gval;
    end
end
g = reshape(g, [d*k 1]);

end

function [yhat] = predict(model,X)
W = model.W;
    [~,yhat] = max(X*W,[],2);
end

