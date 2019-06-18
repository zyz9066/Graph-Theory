% Section 12.3:
% Kruskel's Algorithm
% Input: Weighted Adjacency Matrix of Connected Graph
% Output: Weighted Adjacency Matrix of Minimal Spanning Tree

function [T] = kruskel(A)
    n = length(A);
    
    P = 1:n;    % vector to hold root for each vertex
    
    % Initialization
    W = A;
    for i = 1:n
        for j = 1:n
            if W(i, j) == 0
                W(i, j) = Inf;
            end
        end
    end
    
    T = zeros(size(W)); % matrix for minimal spanning tree
    
    % while there still exist edges not being checked
    while ~isinf(min(W(:)))
        
        [w_min, idx] = min(W(:));   % find the edge with minimal weight
        [row, col] = ind2sub(size(W), idx);
        
        % label selected edge
        W(row, col) = Inf;
        W(col, row) = Inf;
        
        r = row;
        c = col;
        
        while P(r) ~= r
            r = P(r);
        end
        
        while P(c) ~= c
            c = P(c);
        end
        
        if r ~= c % check if end vertices have different root
            % add edge to minimal spanning tree
            T(row, col) = w_min;
            T(col, row) = w_min;
            
            % update root for vertex
            P(r) = c;

        end
    end  
end