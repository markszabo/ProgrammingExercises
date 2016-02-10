classdef command < handle %needed to enable functions to change the properties of the class 
   properties
      text
      mask % spots on the map it paints to
      numberOfPaintedSpots
   end
   methods
      function c = command(t, m, nr)
           c.text = t;
           c.mask = 0;%m;
           c.numberOfPaintedSpots = nr;
      end
      
      function recalculateNrOfPaintedSpots(obj, map)
          newMap = executeCommand(map, obj.text);
          obj.numberOfPaintedSpots = sum(sum(map-newMap))/2;
      end
   end
end