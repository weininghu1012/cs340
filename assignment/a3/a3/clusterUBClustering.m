function [model] = clusterUBClustering(X,K,nModels)

[N,D] = size(X);

for m = 1:nModels
    model.subModel{m} = clusterKmeans(X,K);
end

for m = 1:nModels
    clusters(:,m) = model.subModel{m}.predict(model.subModel{m},X);
end
%clusters = mode(clusters,2);


% times when two samples appears in the same cluster, record the time
T = zeros(N,N);
for i = 1:N
    for j = 1:N
        T(i,j) = sum(clusters(i,:) == clusters(j,:))/nModels;
    end
    
end

cluster = zeros(N,1); % store the label for each sample
visited = zeros(N,1); %keep track of what samples have been visited

K = 0;
eps = 0.5;
minPts = 4;

for i = 1:N
    if (~visited(i))
        visited(i) = 1;
        clear neighbors;
        % We consider points that appear in the same cluster more than half
        % of the time in the same cluster
        neighbors = find(T(:,i) > eps);
        if (length(neighbors) >=minPts)
            K = K+1;
            [visited,cluster] = expand(X,i,neighbors,K,eps,minPts,T,visited,cluster);
        end
    end
end

model.clusters = clusters;



% If we only have two features, make a colored scatterplot
if D == 2
    clf;hold on;
    colors = getColorsRGB;
    for k = 1:K
        plot(X(clusters==k,1),X(clusters==k,2),'o','Color',.75*colors(k,:),'MarkerSize',5,'MarkerFaceColor',.75*colors(k,:));
    end
end
end



function [visited,cluster] = expand(X,i,neighbors,K,eps,minPts,D,visited,cluster)
cluster(i) = K;
ind = 0;
while 1
    ind = ind+1;
    if ind > length(neighbors)
        break;
    end
    n = neighbors(ind);
    cluster(n) = K;
    
    if ~visited(n)
        visited(n) = 1;
        neighbors2 = find(D(:,n) > eps);
        if length(neighbors2) >= minPts
            neighbors = [neighbors;setdiff(neighbors2,neighbors)];
        end
    end
    
    if size(X,2) == 2
        % Make plot
        clf;
        hold on;
        colors = getColorsRGB;  
        symbols = getSymbols;
        h = plot(X(cluster==0,1),X(cluster==0,2),'.');
        set(h,'Color',[0 0 0]);
        for k = 1:K
            h = plot(X(cluster==k,1),X(cluster==k,2),'.');
            set(h,'Color',colors(k,:),'Marker',symbols{k},'MarkerSize',12);
        end
        pause(.01);
    end
    
end
end


