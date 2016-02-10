function commands = lookForSquares(oldMap)
    commands = command.empty;
    map = oldMap;
    [rows, columns] = size(map);
    for r=2:(rows-1)
        for c=2:(columns-1)
            s = 1;
            while isSquare(map, r, c, s) == 1
                s = s+1;
                r = r+1;
                c = c+1;
            end
            if s > 1 %we found a square
                s = s-1;
                mask = zeros(rows, columns);
                nr = 0;
                for i=(r-s):(r+s)
                    for j=(c-s):(c+s)
                        mask(i,j) = 1;
                        nr = nr + 1;
                    end
                end
                commands(length(commands)+1) = command(['PAINT_SQUARE ',num2str(r-1),' ',num2str(c-1),' ',num2str(s)], mask, nr);
            end
        end
    end
end