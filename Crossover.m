function [ fastestRoute ] = Crossover( routeA, routeB )
%Crossover takes in two routes. It joins the two routes to make the
%shortest version of teh two routes. If the new crossover route is still
%longer than its parents the shortest parent will be returned.
%   Detailed explanation goes here

% finds shorest parent
shortParent=shortestRoute(routeA, routeB);

% blends front of route A to back of route B
routeAB=blendRoutes(routeA, routeB);
% blends front of route B to back of route A
routeBA=blendRoutes(routeB, routeA);

% Determines if routeAB is better than routeBA
shortChild=shortestRoute(routeAB, routeBA);

if length(shortChild)<length(shortParent) % The child is the best route
    fastestRoute=shortChild;
else % the parent is equal to or better than the child
    fastestRoute=shortParent;

end

% % Tests
% This test may not work
% A=[[1 1]; [1 2]; [1 3]; [1 4]; [1 5]; [2 5]; [3 5]; [4 5]; [4 4]; [4 3]; [3 3]; [3 4]; [2 4]; [2 3]; [2 2]; [3 2]; [4 2]; [5 2]; [5 3]; [5 4]; [5 5]; [6 5]; [6 6]];
% B=[[1 1]; [2 1]; [2 2]; [3 2]; [3 1]; [4 1]; [5 1]; [6 1]; [6 2]; [6 3]; [6 4]; [5 4]; [4 4]; [3 4]; [2 4]; [1 4]; [1 5]; [1 6]; [2 6]; [3 6]; [4 6]; [5 6]; [6 6]];

% A=[[1 1]; [2 1]; [2 2]; [1 2]; [1 3]; [2 3]; [3 3]];
% B=[[1 1]; [1 2]; [2 2]; [2 1]; [3 1]; [3 2]; [3 3]];

% Another Test
% A=[[1 1]; [1 2]; [1 3]; [1 4]; [1 5]; [2 5]; [2 4]; [3 4]; [4 4]; [4 3]; [5 3]; [5 4]; [5 5]; [6 5]];
% B=[[1 1]; [2 1]; [2 2]; [3 2]; [3 3]; [3 4]; [3 5]; [4 5]; [5 5]; [6 5]];