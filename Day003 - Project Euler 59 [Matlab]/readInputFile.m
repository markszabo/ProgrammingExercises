function ciphertext = readInputFile(filename)
    file = fopen(filename,'r'); % open the file for reading
    cipherChar = strsplit(fgets(file),',');
    fclose(file);
    ciphertext = [];
    for i=1:length(cipherChar)
        ciphertext(i) = str2num(cipherChar{i});
    end
end