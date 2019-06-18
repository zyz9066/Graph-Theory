% Section 12.5:
% Depth-First Search Algorithm
% Input: Adjacency Matrix of Graph and Starting Vertex
% Output: Vector of Labels for the Vertices

function [V, P] = depth_first_search(A, s)

    n = length(A);
    
    V = NaN(1, n);    % vector of labels for each vertex
    P = 1:n;  % vector of previous vertex for each vertex

    t = 1;  % label number
    
    S = s; % vector to hold visited vertices
    
    V(s) = 1;
    t = t + 1;
    
    % while there stil exist unfinished vertices
    while ~isempty(S)
        u = S(1);   % check last visited vertex
        
        for i = 1:n
            if isnan(V(i)) && A(u, i) > 0
                V(i) = t;
                P(i) = u;
                t = t + 1;
                S = [i S];
                break
            end
            
            % pop finished vertex
            if i == n
                S(1) = [];
            end
        end
        
        
        if isempty(S) && sum(isnan(V)) > 0
            [maxi, idx] = max(isnan(V));
            S = idx;
            V(idx) = t;
            t = t + 1;
        end
            
    end
end