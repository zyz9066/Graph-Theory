% Section 10.4:
% Floyd-Warshall Algorithm
% Input: Weighted Adjacency Matrix of Graph
% Output: Matrix of shortest distances between any two points

function [D] = floyd_warshall(A)
    n = length(A);
    
    % Initialization
    D = A;
    for i = 1:n
        for j = 1:n
            if i ~= j && D(i, j) == 0
                D(i, j) = Inf;
            end
        end
    end
    
    % Update matrix
    for k = 1:n
        D = min(D, D(:, k) + D(k, :));
    end 
end
