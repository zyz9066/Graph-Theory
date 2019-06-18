% Section 10.4:
% Dijkstra's Algorithm (Improved)
% Input: Weighted Adjacency Matrix of Graph
% Input parameter: weighted adjacency matrix, source vertex, target vertex
% Output: Length of shortest path
        
function [d] = dijkstra_improved(A, s, t)
    
    n = length(A);
    
    % Initialization
    D = Inf(1, n);  % vector to hold current distances from source vertex
    D(s) = 0;   % assign to source vertex with distance 0
    
    Q = 1:n;    % vector to hold unlabeled vertices
    
    while ~isempty(Q)   % while there still exist unlabeled vertices
        [dmin, idx] = min(D(Q));    % find vertex with min distance
        
        % update every unlabeled vertex which is adjacent to selected vertex
        for i = 1:length(Q)
            if A(Q(idx), Q(i)) > 0 && D(Q(i)) > dmin + A(Q(idx), Q(i))
                D(Q(i)) = dmin + A(Q(idx), Q(i));
            end
        end
        
        Q(idx) = [];    % label selected vertex
    end
    
    d = D(t);
end