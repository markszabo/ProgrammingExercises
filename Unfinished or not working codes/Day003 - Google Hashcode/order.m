classdef order < handle %needed to enable functions to change the properties of the class 
   properties
      x;
      y;
      items;
   end
   methods
       function ord = order(location, nrOfItems, orderedItems)
           xy = strsplit(location, ' ');
           ord.x = str2double(xy{1});
           ord.y = str2double(xy{2});
           aItems = strsplit(orderedItems, ' ');
           ord.items = zeros(1,length(aItems));
           for i=1:length(aItems)
               ord.items(i) = str2double(aItems(i));
           end
       end
   end
end