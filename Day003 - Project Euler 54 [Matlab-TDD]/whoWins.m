function winner = whoWins(p1, p2)
    value1 = getValueOfHand(p1);
    value2 = getValueOfHand(p2);

    %store the values of the cards in each hand
    vs1 = zeros(5,1);
    vs2 = zeros(5,1);
    for i=1:5
        vs1(i) = p1.cards(i).value;
        vs2(i) = p2.cards(i).value;
    end
    vs1 = sort(vs1);
    vs2 = sort(vs2);
    %high card (*1)
    firstNotEqualCard = 5;
    while vs1(firstNotEqualCard) == vs2(firstNotEqualCard)
        firstNotEqualCard = firstNotEqualCard - 1;
    end
    value1 = value1 + vs1(firstNotEqualCard);
    value2 = value2 + vs2(firstNotEqualCard);
    
    winner = 0;
    if value1 > value2
        winner = 1;
    end
    if value2 > value1
        winner = 2;
    end
end