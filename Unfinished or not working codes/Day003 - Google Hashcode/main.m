clear;
fileName = 'test';
%% read input file
file = fopen('test.in','r'); % open the file for reading
tmpArray = str2double(strsplit(fgets(file),' '));
rows = tmpArray(1);
columns = tmpArray(2);
nrOfDrones = tmpArray(3);
nrOfTurns = tmpArray(4);
maxPayload = tmpArray(5);

drones = drone.empty;
for i=1:nrOfDrones
    drones(i) = drone();
end
nrOfProducts = str2double(fgets(file));
productWeights = str2double(strsplit(fgets(file),' '));

nrOfWarehouses = str2double(fgets(file)); 
warehouses = warehouse.empty;
for i=1:nrOfWarehouses
    warehouses(i) = warehouse(fgets(file),fgets(file));
end

nrOfOrders = str2double(fgets(file)); 
orders = order.empty;
for i=1:nrOfOrders
    orders(i) = order(fgets(file),fgets(file),fgets(file));
end

%% simulation
for turn=1:nrOfTurns
    %check if there is an available drone
    for d=1:nrOfDrones
        if drones(d).nextAvailableTurn == turn
            %calculate which order can be fulfilled in the shortest time
            
        end
    end
end
