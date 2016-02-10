function map = executeCommand(oldMap, text)
    map = oldMap;
    splittedText = strsplit(text,' ');
    if strcmp(splittedText{1}, 'PAINT_SQUARE') %PAINT_SQUARE 4 697 1
        r = str2num(splittedText{2});
        c = str2num(splittedText{3});
        s = str2num(splittedText{4});
        for i=(r-s):(r+s)
            for j=(c-s):(c+s)
                map(i,j) = -1;
            end
        end
    else % PAINT_LINE 13 5 13 6
        r1 = str2num(splittedText{2});
        c1 = str2num(splittedText{3});
        r2 = str2num(splittedText{4});
        c2 = str2num(splittedText{5});
        for i=r1:r2
            for j=c1:c2
                map(i,j) = -1;
            end
        end
    end
end