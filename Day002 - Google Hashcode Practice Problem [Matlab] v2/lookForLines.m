function commands = lookForLines(oldMap)
    commands = command.empty;
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
                        break;
                    end
                end
                if isLine == 1 %if it's a line
                    mask = zeros(size(map));
                    nr = 0;
                    for i=0:(lineLength-1)
                        mask(r,c+i+1) = 1;
                        nr = nr + 1;
                    end
                    commands(length(commands)+1) = command(['PAINT_LINE ',num2str(r-1),' ',num2str(c),' ',num2str(r-1),' ',num2str(c+lineLength-1)], mask, nr);
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
                        break;
                    end
                end
                if isLine == 1 %if it's a line
                    mask = zeros(size(map));
                    nr = 0;
                    for i=0:(lineLength-1)
                        mask(r+i+1,c) = 1;
                        nr = nr + 1;
                    end
                    commands(length(commands)+1) = command(['PAINT_LINE ',num2str(r),' ',num2str(c-1),' ',num2str(r+lineLength-1),' ',num2str(c-1)], mask, nr);
                end
            end
        end
        end
    end
end