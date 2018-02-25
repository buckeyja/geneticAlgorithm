function [ shortRoute ] = shortestRoute( routeA, routeB )
%shorestRoute takes in two routes and returns the shortest. If the routes
%are the same length it just returns route B
%   Detailed explanation goes here

if length(routeA)<length(routeB)
    shortRoute=routeA;
else
    shortRoute=routeB;


end

