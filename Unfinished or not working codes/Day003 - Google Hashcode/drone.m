classdef drone < handle %needed to enable functions to change the properties of the class 
   properties
      x;
      y;
      nextAvailableTurn;
   end
   methods
       function dr = drone()
           dr.x = 0;
           dr.y = 0;
           dr.nextAvailableTurn = 1;
       end
   end
end