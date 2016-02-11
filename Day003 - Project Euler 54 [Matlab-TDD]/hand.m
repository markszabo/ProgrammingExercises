classdef hand < handle %needed to enable functions to change the properties of the class 
   properties
      cards = card.empty;
   end
   methods
       function h = hand(text)
          cardsString = strsplit(text,' ');
          for i=1:5
              h.cards(i) = card(cardsString{i}(1),cardsString{i}(2));
          end
      end
   end
end