classdef card < handle %needed to enable functions to change the properties of the class 
   properties
      suit % 1-H, 2-C, 3-S, 4-D
      value % 2, 3, 4, 5, 6, 7, 8, 9, T-10, Jack-11, Queen-12, King-13, Ace-14.
   end
   methods
      function c = card(v, s)
          switch s
              case 'H'
                  c.suit = 1;
              case 'C'
                  c.suit = 2;
              case 'S'
                  c.suit = 3;
              case 'D'
                  c.suit = 4;
          end
          switch v
              case 'A'
                  c.value = 14;
              case 'K'
                  c.value = 13;
              case 'Q'
                  c.value = 12;
              case 'J'
                  c.value = 11;
              case 'T'
                  c.value = 10;
              otherwise
                  c.value = str2num(v);
          end
      end
   end
end