function [ moves ] = isValid( maze, point )
%isValid takes in a point on a maze and returns all valid possible moves.
%   TODO: add last which would prevent going back to last point.

moves=[];

up=[point(1)-1 point(2)];
down=[point(1)+1 point(2)];
left=[point(1) point(2)-1];
right=[point(1) point(2)+1];

% TODO: add check for value=1
try % Moove up
    maze(up(1), up(2));
    moves=[moves; up];
catch
   % fprintf('up move invalid \n') 
end

try % Move down
    maze(down(1), down(2));
    moves=[moves; down];
catch
    % fprintf('down move invlaid \n')
end


try % Move left (not working
    maze(left(1), left(2));
    moves=[moves; left];
catch
    % fprintf('left move invalid \n')
end

try % move right
    maze(right(1), right(2));
    moves=[moves; right];
catch 
    % fprintf('right move invalid \n')
end

% if(maze(point(1) point(2)=~1)


end

