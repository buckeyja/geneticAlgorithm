function [ bestPath ] = GeneticAlgorithm( maze,begin,finish )
%GeneticAlgorithm~ takes in a maze matrix and returns the best route using a genetic
%algorthim
%   A Genetic Algorthim has four parts Population, Mutation, Crossover and
%   Person of Dominance. For simplicity and readability these were made
%   into their own funcitons.

% populates a random path from start (begin) to finish (finish) using a
% Genetic Algorithm

% To Improve output path look at Crossover. Currently it is very dumb

% Used for parts 1-2
muteRouteList = zeros(0,2); % creates an empty matrix to store mutated routes
muteRouteData = zeros(0,3); % creates an empty matrix to store data on each mutated route [start_index end_index #route]

originalPopulation=20; % This must be an even number 
for u=1:originalPopulation
    % (Part 1) Populate routes 
    path = Populate(maze,begin,finish);
    
    % (Part 2) Mutate Populared Route
    mutePath = Mutate(path);
    
    % Combine populated and mutated routes into a single matrix
    % mutePathData = [pathStart pathEnd pathNumber]
    mutePathData = [length(muteRouteList) length(muteRouteList)+length(mutePath) u];
    muteRouteData = [muteRouteData; mutePathData]; 
    muteRouteList = [muteRouteList; mutePath];
    
end


% Used for parts 2-3
routeList = zeros(0,2); % creates an empty matrix to store the finalized routes
routeData = zeros(0,3); % creates an empty matrix to store data on each of the final routes [start_index end_index #route

for m=1:originalPopulation/2
    
    % Route A (To be crossed with route B)
    routeLengthA = muteRouteData((2*m-1),2)-muteRouteData((2*m-1),1); % startIndex - endIndex
    % mat2cell(routeToBeSplit, [startIndex endIndex remainingLength], numColumns)
        % NOTE: [] must equal #numRows
    routeA = mat2cell(muteRouteList, [muteRouteData((2*m-1),1) routeLengthA length(muteRouteList)-(routeLengthA+muteRouteData((2*m-1),1))], 2);
    % Route B (To be crossed with route A)
    routeLengthB = muteRouteData((2*m),2)-muteRouteData((2*m),1);
    routeB = mat2cell(muteRouteList, [muteRouteData((2*m),1) routeLengthB length(muteRouteList)-(routeLengthB+muteRouteData((2*m),1))], 2);
    % NOTE: 2*m and 2*m-1 were used to range from 1 to originalPopulation.
    % This was done becuase Crossover takes two routes and returns 1
    
    % (Part 3) Crossover
    route = Crossover(routeA{2}, routeB{2});
    
    % store the newly made routes in a matrix
    singleRouteData = [length(routeList) length(routeList)+length(route) m];
    routeData = [routeData; singleRouteData]; 
    routeList = [routeList; route];    
    
end


ShortestRoute=(routeData(1,2)-routeData(1,1)); % Lenght of the shortest route. (This is declared so the errors are not thrown)
ShortestRouteData=routeList(1,:);
% (Part 4) Person of Dominance
for n=1:originalPopulation/2
    
    % Pulls out the length of each route
    singleRouteLength=(routeData(n,2)-routeData(n,1));
    singleRouteData=routeData(n,:);
    % Person Of Dominance
    if singleRouteLength < ShortestRoute % determines the shortest route
        ShortestRoute = singleRouteLength;
        ShortestRouteData = singleRouteData; % logs the data of the shortest route
    end
end

bPath = mat2cell(routeList, [ShortestRouteData(1,1) ShortestRoute (length(routeList)-(ShortestRoute+ShortestRouteData(1,1)))], 2);
bestPath = bPath{2};


end

