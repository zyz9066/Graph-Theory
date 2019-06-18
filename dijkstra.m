% Section 10.4:
% Dijkstra's Algorithm
% Input: Weighted Adjacency Matrix of Graph
% Input parameter: weighted adjacency matrix, source vertex, target vertex
% Output: Shortest Path (as a list or vector) and length of shortest path

function [p, d] = dijkstra(A, s, t)
    
    n = length(A);
    
    % Initialization
    D = Inf(1, n);  % vector to hold current distances from source vertex
    P = NaN(1, n);  % vector to hold previous vertex for each vertex
    
    D(s) = 0;   % assign to source vertex with distance 0
    
    Q = 1:n;    % vector to hold unlabeled vertices
    
    while ~isempty(Q)   % while there still exist unlabeled vertices
        [d_min, idx] = min(D(Q));   % find vertex with min distance
        
        % update every unlabeled vertex which is adjacent to selected vertex
        for i = 1:length(Q)
            if A(Q(idx), Q(i)) > 0 && D(Q(i)) > d_min + A(Q(idx), Q(i))
                D(Q(i)) = d_min + A(Q(idx), Q(i));
                P(Q(i)) = Q(idx);
            end
        end
        
        Q(idx) = [];    % label selected vertex
    end
    
    d = D(t);
    
    % construct the shorest path from source to target
    p = t;
    i = t;
    while ~isnan(P(i))
        p = [P(i) p];
        i = P(i);
    end
end