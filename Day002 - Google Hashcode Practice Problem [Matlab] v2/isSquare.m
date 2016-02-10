function itIs = isSquare(map, r, c, s)
    [rows, columns] = size(map);
    itIs = 1;
    %test if out of boundaries
    if r-s < 1 || r+s > rows || c-s < 1 || c+s > columns
        itIs = 0;
    else
        for i=(r-s):(r+s)
            for j=(c-s):(c+s)
                if map(i,j) == 0
                    itIs = 0;
                end
            end
        end
    end
end