clear;

file = fopen('p054_poker.txt','r'); % open the file for reading
nrOfPlayer1Win = 0;
while ~feof(file)
    line = fgets(file);
    player1 = hand(line(1:14));
    player2 = hand(line(16:29));
    if whoWins(player1, player2) == 1
        nrOfPlayer1Win = nrOfPlayer1Win + 1;
    end
    if whoWins(player1, player2) == 0
        a = 'error';
    end
end
fclose(file);

nrOfPlayer1Win