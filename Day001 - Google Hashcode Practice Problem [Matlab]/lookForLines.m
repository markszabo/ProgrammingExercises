function [commands, map] = lookForLines(oldMap)
    commands = {};
    map = oldMap;
    [rows, columns] = size(map);
    for inverseLineLength=1:max(rows,columns) % first look for very long lines, then shorter
        lineLength = max(rows,columns) - inverseLineLength + 1;
        if lineLength <= columns
        %look for horizontal lines
        for r = 1:rows %check in every row
            for c = 0:(columns-lineLength) %starting from any point
                isLine = 1;
                for i=0:(lineLength-1)
                    if map(r,c+i+1) ~= 1 %if one cell is not 1
                        isLine = 0; %then it's not a line
                    end
                end
                if isLine == 1 %if it's a line, add to commands and delete the covered cells from the map
                    commands{end+1} = ['PAINT_LINE ',num2str(r-1),' ',num2str(c),' ',num2str(r-1),' ',num2str(c+lineLength-1)];
                    for i=0:(lineLength-1)
                        map(r,c+i+1) = -1;
                    end
                end
            end
        end
        end
        %look for vertical lines
        if lineLength <= rows
        for c = 1:columns %check in every column
            for r = 0:(rows-lineLength) %starting from any point
                isLine = 1;
                for i=0:(lineLength-1)
                    if map(r+i+1,c) ~= 1 %if one cell is not 1
                        isLine = 0; %then it's not a line
                    end
                end
                if isLine == 1 %if it's a line, add to commands and delete the covered cells from the map
                    commands{end+1} = ['PAINT_LINE ',num2str(r),' ',num2str(c-1),' ',num2str(r+lineLength-1),' ',num2str(c-1)];
                    for i=0:(lineLength-1)
                        map(r+i+1,c) = -1;
                    end
                end
            end
        end
        end
    end
end