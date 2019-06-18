% Section 12.6:
% Strongly Connected Orientation Algorithm
% Input: Adjacency Matrix of Connected Graph
% Output: Adjacency Matrix of Digraph with Strongly Connected Orientation

function [B] = strongly_connected_orientation(A)
    n = length(A);
    B = A;
    
    [V, P] = depth_first_search(A, 1); % apply depth first search
    
    for i = 1:n
        for j = 1:n
            % check every edge
            if B(i, j) > 0
                % orient edge according to minimal spanning tree
                if V(i) < V(j)
                    if P(j) == i
                        B(j, i) = 0;
                    else
                        B(i, j) = 0;
                    end
                else
                    if P(i) == j
                        B(i, j) = 0;
                    else
                        B(j, i) = 0;
                    end
                end
            end
        end
    end
end