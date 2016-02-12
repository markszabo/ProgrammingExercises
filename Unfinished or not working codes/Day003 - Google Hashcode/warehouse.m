classdef warehouse < handle %needed to enable functions to change the properties of the class 
   properties
      x;
      y;
      items;
   end
   methods
       function wh = warehouse(location, storedItems)
           xy = strsplit(location, ' ');
           wh.x = str2double(xy{1});
           wh.y = str2double(xy{2});
           aItems = strsplit(storedItems, ' ');
           wh.items = zeros(1,length(aItems));
           for i=1:length(aItems)
               wh.items(i) = str2double(aItems(i));
           end
       end
   end
end