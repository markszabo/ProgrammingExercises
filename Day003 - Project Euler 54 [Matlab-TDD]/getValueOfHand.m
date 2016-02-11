function value = getValueOfHand(hand)
    value = 0;
    %find the highest card in each hand
    high = 0;
    for i=1:5
        if hand.cards(i).value > high
            high = hand.cards(i).value;
        end
    end
    %store the values of the cards in each hand
    vs = zeros(5,1);
    for i=1:5
        vs(i) = hand.cards(i).value;
    end
    vs = sort(vs);
    
    %Straight Flush: All cards are consecutive values of same suit (*100.000.000.000.000)
    
    %Four of a Kind: Four cards of the same value (*1.000.000.000.000)
    if (vs(1) == vs(2) & vs(1) == vs(3) & vs(1) == vs(4)) | (vs(2) == vs(3) & vs(2) == vs(4) & vs(2) == vs(5))
        value = value + vs(3) * 1000000000000;
    end
    %Full House: Three of a kind and a pair (*10.000.000.000)
    if ((vs(1) == vs(2)) & (vs(1) == vs(3)) & (vs(4) == vs(5))) | ((vs(1) == vs(2)) & (vs(3) == vs(4)) & (vs(3) == vs(5)))
        value = value + vs(3) * 10000000000;
    end
    
    %Flush: All cards of the same suit (*100.000.000)
    if (hand.cards(1).suit == hand.cards(2).suit) & (hand.cards(1).suit == hand.cards(3).suit) & (hand.cards(1).suit == hand.cards(4).suit) & (hand.cards(1).suit == hand.cards(5).suit)
        value = value + high*100000000;
    end
    
    %Straight: All cards are consecutive values (*1.000.000)
    if (vs(5)-vs(4))*(vs(4)-vs(3))*(vs(3)-vs(2))*(vs(2)-vs(1)) == 1
        value = value + vs(5)*1000000;
    end
    
    %Three of a Kind (*10.000)
    for i=1:3
        for j=(i+1):4
            for k=(j+1):5
                if hand.cards(i).value == hand.cards(j).value && hand.cards(i).value == hand.cards(k).value
                    value = value + 10000*hand.cards(j).value;
                end
            end
        end
    end    
    
    %pair (*100)
    for i=1:4
        for j=(i+1):5
            if hand.cards(i).value == hand.cards(j).value
                value = value + 100*hand.cards(j).value + 1500;
            end
        end
    end
end