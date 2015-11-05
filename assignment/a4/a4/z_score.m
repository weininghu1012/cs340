load cities.mat
for c = 1:9
    my_z = zscore(ratings(:,c));
    index = find(abs(my_z) >= 4);
    [m,n] = size(index);
    if (m >0)
        fprintf('Category is %s\n', categories(c,:));
        city = names(index,:);
        disp(city);
    end
end    
    
        