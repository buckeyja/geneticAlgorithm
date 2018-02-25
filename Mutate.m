function [ newRoute ] = Mutate( route )
%mutate searches for nodes which can be removed from the given route and if possible shortens the given route.
%   Detailed explanation goes here


foundRoute=0; % foundRoute is used to determine if the route was shortened

for front=1:length(route)
    for backIndex=length(route):-1:front+2 % front+2 prevents Mute from incorectly identifying node neighbors as shorter routes
        if canShorten(route(front,:),route(backIndex,:))==1 % The route can be shortened
            
            back=length(route)-backIndex+1;    % back is the number of elements to the end of route
            middle=length(route)-(front+back); % middle is the number of elements to be removed from route
            % The route is broken into three parts so the middle can be removed
            subPaths=mat2cell(route, [front middle back], 2);
            
            % The front and back are joined
            newRoute=[subPaths{1};subPaths{3}];
            
            % foundRoute prevents the for loops from identifying worse "shorter" routes
            foundRoute=1;
        end
        if foundRoute==1
            break; % These breaks prevent for loops finding worse "shorter" routes
        end
    end
    if foundRoute==1
        break; % These breaks prevent for loops finding worse "shorter" routes
    end
end

% The route could not be shortened
if foundRoute==0
    newRoute=route;
end

end


% % route that can be shortened
% route=[[2 1]; [2 2]; [1 2]; [1 3]; [2 3]; [3 3]; [3 2]; [4 2]; [4 3]];
% % route that cannot be shortened
% route=[[1 1]; [2 1]; [2 2]; [2 3]; [3 3]; [3 4]; [4 4]; [4 5]];



