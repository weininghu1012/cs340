function [label] = runRandomWalk(A,labelList,v)

n = length(A);
labels = zeros(n, 1);
% Copy the initial labels from labellist
for i=1:length(labelList)
	labels(labelList(i, 1)) = labelList(i, 2);
end
e = zeros(n, 1);
num = 0;
while 1
	k = 0;
    % Store all the neighbor nodes
	for i = 1 : n
        % If meet a node that is connected? 1 in the adjacency matrix
		if A(v, i) == 1
			k = k + 1;
			e(k) = i;
		end
	end
    % if you meet a node that has label, either 1 or -1
	if labels(v) ~= 0
		num = randi(k + 1);
        % If you happened to pick the 'node' with the label
		if num == k + 1
			label = labels(v);
			return;
		end
	else
		num = randi(k);
    end
    % Assign to the new node
	v = e(num);
end