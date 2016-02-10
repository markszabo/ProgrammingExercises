function map = readInputFile(filename)
    file = fopen(filename,'r'); % open the file for reading
    splittedline = strsplit(fgets(file),' '); % the first row is the size of the paint
    rows = str2num(splittedline{1});
    columns = str2num(splittedline{2});
    map = zeros(rows, columns);
    rownr = 1;
    while ~feof(file)
        line = fgets(file);
        for i=1:columns
            if strcmp(line(i),'#') 
                map(rownr,i) = 1; 
            end
        end
        rownr = rownr+1;
    end
    fclose(file);
end