function [ bestRoute ] = blendRoutes( routeA, routeB )
%blenedRoutes takes in two routes and joins the front of route A to the
%back of route B if possible
    % Known problems: If the routes start and end at the same point
    % blendRoutes will blend the routes on the first pass.

canBlend=0; % canBlend is used to determine if the route was blended
shortParent=shortestRoute(routeA, routeB); % finds shortest parent

% I think you should reverse indexA and indexB
for indexB=length(routeB):-1:1 % front+2 prevents Mute from incorectly identifying node neighbors as shorter routes
    for indexA=1:length(routeA)
        if canShorten(routeA(indexA,:),routeB(indexB,:))==1 % The route can be shortened
            
            % Pulls the front off A and the back off B
            AsubPaths=mat2cell(routeA, [indexA length(routeA)-indexA], 2);
            BsubPaths=mat2cell(routeB, [(indexB-1) (length(routeB)-indexB+1)], 2);
            
            % Joins the front of A to the back of B
            blended=[AsubPaths{1}; BsubPaths{2}];
                      
            % foundRoute prevents the for loops from identifying worse "shorter" routes
            canBlend=1;
        end
        if canBlend==1
            break; % These breaks prevent for loops finding worse "shorter" routes
        end
    end
    if canBlend==1
        break; % These breaks prevent for loops finding worse "shorter" routes
    end
end

% checks if the blened route is shorter than route A and B
if length(blended)<length(shortParent)
    bestRoute=blended;
else
    bestRoute=shortParent;


end

