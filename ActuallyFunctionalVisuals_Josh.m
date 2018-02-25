%images: visualsblack.png & visualswhite.png
% 
% numb = input('How large of a matrix would you like?  \n');
% maze = zeros(numb);

%zhttps://www.mathworks.com/matlabcentral/answers/100366-how-can-i-remove-the-grey-borders-from-the-imshow-plot-in-matlab-7-4-r2007a
clear all
close all
clc


begin = [1 1];
finish = [5 5];
maze = zeros(5);
path = GeneticAlgorithm(maze,begin,finish);

for z = 1:length(maze)^2
    subplot(length(maze),length(maze),z);imshow('visualswhite.png');
end

for k = 1:length(path)
    row=path(k,1);
    col=path(k,2);
    p = ((row-1)*(length(maze))) + col;
    subplot(length(maze),length(maze),p);imshow('Roberto.png');
    if k > 1
        row2=path(k-1,1);
        col2=path(k-1,2);
        p2 = ((row2-1)*(length(maze))) + col2;
        subplot(length(maze),length(maze),p2);imshow('visualsblack.png');
    end
    pause(.25);
end




%Size of map
dim = 10;

%Wheel dimensions
d = 2.225;
C = pi*d;
rot = -(dim/C)*360;

mylego = legoev3('usb');
leftmotor = motor(mylego,'D');
rightmotor = motor(mylego,'A');

V = [0 0; path];

c = 2;
d = 1;

for k = 3:length(V(:,1))

%Facing Up Or Right
if (V(k-1,1) > V(k-2,1)) || (V(k-1,2) < V(k-2,2))
if (V(k,c) == V(k-1,c)) && (V(k-2,d) ~= V(k,d))

    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
        left = readRotation(leftmotor);
        right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);

elseif V(k,c) > V(k-1,c)
    %Turn Right
    resetRotation(leftmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = 30;
    start(rightmotor)

    left = readRotation(leftmotor);
    
    while left > (rot+50)/2
      left = readRotation(leftmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
    %Straight
    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
      left = readRotation(leftmotor);
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
elseif V(k,c) < V(k-1,c)
    %Turn Left
    resetRotation(rightmotor);

    leftmotor.Speed = 30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    right = readRotation(rightmotor);
    
    while right > (rot+50)/2
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
    %Straight
    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
      left = readRotation(leftmotor);
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
elseif (V(k,c) == V(k-1,c)) && (V(k-2,d) == V(k,d))
    %Turn Around
    resetRotation(leftmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = 30;
    start(rightmotor)

    left = readRotation(leftmotor);
    
    while left > rot+50
      left = readRotation(leftmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
    %Straight
    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
      left = readRotation(leftmotor);
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
end
    
    
    
%Facing Down or Right
else
if (V(k,c) == V(k-1,c)) && (V(k-2,d) ~= V(k,d))

    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
        left = readRotation(leftmotor);
        right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);

elseif V(k,c) > V(k-1,c)
    %Turn Right
    resetRotation(rightmotor);

    leftmotor.Speed = 30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    right = readRotation(rightmotor);
    
    while right > (rot+50)/2
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
    %Straight
    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
      left = readRotation(leftmotor);
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
elseif V(k,c) < V(k-1,c)
    %Turn Left
    resetRotation(leftmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = 30;
    start(rightmotor)

    left = readRotation(leftmotor);
    
    while left > (rot+50)/2
      left = readRotation(leftmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
    %Straight
    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
      left = readRotation(leftmotor);
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
elseif (V(k,c) == V(k-1,c)) && (V(k-2,d) == V(k,d))
    %Turn Around
    resetRotation(leftmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = 30;
    start(rightmotor)

    left = readRotation(leftmotor);
    
    while left > rot+50
      left = readRotation(leftmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
    %Straight
    resetRotation(leftmotor);
    resetRotation(rightmotor);

    leftmotor.Speed = -30;
    start(leftmotor)
    rightmotor.Speed = -30;
    start(rightmotor)

    left = readRotation(leftmotor);
    right = readRotation(rightmotor);

    while left > rot/2 || right > rot/2
      left = readRotation(leftmotor);
      right = readRotation(rightmotor);
    end

    stop(leftmotor);
    stop(rightmotor);
    
end
end

k = k+1;

%Vertical Face
if V(k-2,1) == V(k-1,1)
    c = 1;
    d = 2;
%Horizontal Face
else
    c = 2;
    d = 1;
end

end