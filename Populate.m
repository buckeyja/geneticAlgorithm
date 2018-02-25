function [ route ] = Populate( maze, begin, goal )
%popRoute generates a route given a maze, begin(start) element and gaol element
%   Detailed explanation goes here

% NOTE on generating random numbers
    % randi(4,1) produces a radom number between 1 and 4

pos=begin; % possition in maze
route=pos; % list of moves to get to finish of maze
 

while pos(1)~=goal(1) || pos(2)~=goal(2) % NOTE: If either x OR y coordinates are incorect continue 
    nextMove=isValid(maze, pos);  % List of potential next moves
    m=randi(length(nextMove), 1); % Randomly assigns value to m which is used to determine which move to take (Evolution)  
    route=[route; nextMove(m,:)]; % Adds ramdonly allocated move to route
    pos=nextMove(m,:);
end
    
end

% Test for function:

% maze=[[0 0]; [0 0]];
% start=[2 1];
% finish=[1 2];