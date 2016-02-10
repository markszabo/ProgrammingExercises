function printOutputFile(commands, outputFile)
    file = fopen(outputFile,'w'); fclose(file); % clear the file
    file = fopen(outputFile,'w');
    [~,nrOfCommands] = size(commands);
    fprintf(file,'%i\n',nrOfCommands); %print the header
    for i=1:nrOfCommands
        fprintf(file,'%s\n',commands{i});
    end
    fclose(file);
end