% Section 12.3:
% Prim's Algorithm
% Input: Weighted Adjacency Matrix of Connected Graph
% Output: Weighted Adjacency Matrix of Minimal Spanning Tree

function [T] = prim(A)
    
    n = length(A);
    
    % Initialization
    D = Inf(1, n);  % vector to hold distance to each vertex
    
    T = zeros(size(A)); % matrix for minimal spanning tree
    
    % randomly pick a source vertex
    r = randi(n);
    D(r) = 0;
    
    P = 1:n;    % vector to hold previous vertex for each vertex
    Q = 1:n;    % vector to hold unlabeled vertices
    
    % check if there still exist unlabeled vertices
    while ~isempty(Q)
        [dmin, idx] = min(D(Q));    % find vertex with minimal distance
        
        % update distance
        for i = 1:length(Q)
            if A(Q(idx), Q(i)) > 0 && D(Q(i)) > A(Q(idx), Q(i))
                D(Q(i)) = A(Q(idx), Q(i));
                P(Q(i)) = Q(idx); 
            end
        end
        
        % update spanning tree matrix
        T(Q(idx), P(Q(idx))) = dmin;
        T(P(Q(idx)), Q(idx)) = dmin;
        
        Q(idx) = [];    % label selected vertex
    end
end