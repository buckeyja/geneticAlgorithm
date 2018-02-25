%Trying to make a matrix of 1's and 0's, where the 1's are walls and 0's
%are viable paths


%zhttps://www.mathworks.com/matlabcentral/answers/100366-how-can-i-remove-the-grey-borders-from-the-imshow-plot-in-matlab-7-4-r2007a
clear all
close all
clc


% maze = zeros(10);
numb = input('What dimention would you like your square matrix to be? (preferably < 20 for speed) \n');
maze = zeros(numb);
mazeSize = size(maze);
begin = input('Please enter the coordinates of the start location. [x y] \n');
while begin(1) < 1 || begin(1) > mazeSize(1) || begin(2) < 1 || begin(2) > mazeSize(1)
    fprintf('The start coordinates must be between 1 and %d \n', mazeSize(1))
    begin = input('Please enter the coordinates of the start location. [x y] \n');
end
finish = input('Please enter the coordinates of the end location. [x y] \n');
while finish(1) < 1 || finish(1) > mazeSize(1) || finish(2) < 1 || finish(2) > mazeSize(1)
    fprintf('The end coordinates must be between 1 and %d \n', mazeSize(1))
    begin = input('Please enter the coordinates of the end location. [x y] \n');
end
% begin = [1 1];
% finish = [8 8];

path = GeneticAlgorithm(maze,begin,finish);

for z = 1:length(maze)^2
    subplot(length(maze),length(maze),z);imshow('visualswhite.png');
end

for k = 1:length(path)
    row=path(k,1);
    col=path(k,2);
    p = ((row-1)*(length(maze))) + col;
    subplot(length(maze),length(maze),p);imshow('robot.jpg');
    if k > 1
        row2=path(k-1,1);
        col2=path(k-1,2);
        p2 = ((row2-1)*(length(maze))) + col2;
        subplot(length(maze),length(maze),p2);imshow('visualsblack.png');
    end
    pause(.25);
end


