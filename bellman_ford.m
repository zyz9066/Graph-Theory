% Section 11.2:
% Bellman-Ford Algorithm
% Input: Weighted Adjacency Matrix of Digraph
% Output: Vector of shortest distances from v1

function [D] = bellman_ford(A, s)
    
    n = length(A);
    
    % Initialization
    W = A;
    for i = 1:n
        for j = 1:n
            if i ~= j && W(i, j) == 0
                W(i, j) = Inf;
            end
        end
    end
    
    D = Inf(1, n);  % vector to hold current distances from source vertex
    D(s) = 0;   % assign to source vertex with distance 0
    
    % update distances from source
    for i = 1:n-1
        for j = 1:n
            d_min = Inf;
            for k = 1:n
                if d_min > D(k) + W(k, j)
                    d_min = D(k) + W(k, j);
                end
            end
            if d_min < D(j)
                D(j) = d_min;
            end
        end
    end
    
    % check if there is any negative weight cycle
    for j = 1:n
        d_min = Inf;
        for k = 1:n
            if d_min > D(k) + W(k, j)
                d_min = D(k) + W(k, j);
            end
        end
        if d_min < D(j)
            disp('No shortest paths. There is a negative weight cycle.');
        end
    end
end
