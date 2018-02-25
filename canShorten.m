function [ bool ] = canShorten( posA, posB )
%canShorten takes to points from the route and determines if the points
%between them can be removed.
%   NOTE: This again assumes movement in left, right, up, and down directions
%   no diagnal movment.

if posA(1)==posB(1) && posA(2)==posB(2) % A and B are equal
    bool=1;
elseif posA(1)==posB(1)-1 && posA(2)==posB(2) % A is above B
    bool=1;
elseif posA(1)==posB(1)+1 && posA(2)==posB(2) % A is below B
    bool=1;
elseif posA(1)==posB(1) && posA(2)==posB(2)+1 % A is right of B
    bool=1;
elseif posA(1)==posB(1) && posA(2)==posB(2)-1 % A is left of B
    bool=1;
else % The points cannot be joined.
    bool=0;
end


end

% NOTES: Tested and works for 3x3 matrix