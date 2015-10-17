function [word_count] = frequency(X,y)
% Compute number of training examples and number of features
[N,D] = size(X);

% Computer number of class lables
C = max(y);
word_count = zeros(C,3);


for c = 1:C
    row = find(y==c);
    count_c = sum(y==c);
    %subtract the rows
    with_c = X(row,:);
    wc = zeros(D,1);
    for j = 1:D
        count0 = sum(with_c(:,j)==0);
        count1 = count_c-count0;
        wc(j) = count1;
        
        
    end
    [sortf,sortIndex] = sort(wc,'descend');
    word_count(c,:) = sortIndex(1:3);
end    
    
