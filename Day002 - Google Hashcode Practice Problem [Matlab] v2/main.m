clear;

task = 'logo';
task = 'right_angle';
%task = 'learn_and_teach';

%% read the input file into a matrix. 0 means . and 1 means #
map = readInputFile([task,'.in']);

%% look for squares - store command and replace in the map with -1
commands = lookForSquares(map);

%% look for lines - store command and replace in the map with -1
newCommands = lookForLines(map);
commands = horzcat(commands, newCommands);

%% find the command with the biggest painted area
maxPaintedArea = 0;
for i=1:length(commands)
    if commands(i).numberOfPaintedSpots > maxPaintedArea
        maxPaintedArea = commands(i).numberOfPaintedSpots;
    end
end

outputCommands = {};

%% start with choosing the biggest area first
for area=maxPaintedArea:-1:1
    % find and select the areas with this size
    i = 1;
    while i < length(commands)
        if commands(i).numberOfPaintedSpots == area
            %then execute this command
            map = executeCommand(map, commands(i).text);
            outputCommands{end+1} = commands(i).text;
            commands(i) = []; %delete the executed command
            i = i - 1; %because we just deleted one command
        end
        i = i + 1;
    end
    % recalculate NrOfPaintedSpots
    for i=1:length(commands)
        commands(i).recalculateNrOfPaintedSpots(map);
    end
end

%% print output file
printOutputFile(outputCommands, [task,'.out']);
