%written by: Tony Vo
clear all; close all; clc;

%data
items = [17 330 1; 30 450 35; 35, 50, 15; ...
    51 89 4; 77 140 4; 90 590 9];

%plotting
hold on
plot(items(:,1),items(:,2),'bd')
xlabel('Item ID')
ylabel('Cost per item ($)')

%total cost
items(:,4) = items(:,2).*items(:,3);

%max total cost and corresponding item id
[max_cost, id2] = max(items(:,4))
item_id_of_max_cost = items(id2)

%sum of total costs
sum_total_costs = sum(items(:,4))

