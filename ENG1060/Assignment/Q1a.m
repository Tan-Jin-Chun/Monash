% Q1a

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 28/12/2020

fprintf('\n Q1a \n\n')

%% code starts here
% Importing the data using importdata function
fid = importdata('owid-covid-data-s3.xlsx');

% Extracting the data (Must be 2:end due as to avoid extracting the header as well)
location = fid.textdata(2:end,3);

% Converting the data from a cell to a string so that strcmpi() function can
%be used
location = string(location);

% Given command
key_locations = ["Australia" "China" "India" "Indonesia" "Malaysia" "Vietnam"];

% Plotting the graphs
% First plot (Total cases against days tracked)
% Using semilogy to ensure y-axis is logarithmacally scaled and x-axis is
% linearly scaled
% A for loop is use to go through each location and plot the graph based on
% the data extracted using the location

figure(1) %figure 1
hold on
% Use the set function to ensure that the y scale is logarithmically scaled
% gca returns the current axes or chart for the current figure, which is typically the last one created or clicked with the mouse.
set(gca, 'YScale', 'log')
for i = 1:length(key_locations)
    x = find(strcmpi(location,key_locations(i)) == 1 );
    days_trac = fid.data(x,1);
    tot_case = fid.data(x,2);
    semilogy(days_trac,tot_case,'--.')
    xlabel('Days Tracked')
    ylabel('Total Cases')
    title('Total Cases Against Days Tracked')
    grid on
end
legend(key_locations,'Location','nw')
hold off

% Plotting the second graph
% Given variable
figure(2)  %figure 2

% Using a for loop to plot the second graph as well
hold on
set(gca, 'YScale', 'log')
for  i = 1:length(key_locations)
    x = find(strcmpi(location,key_locations(i)) == 1 );
    days_trac = fid.data(x,1);
    tot_death = fid.data(x,5);
    semilogy(days_trac,tot_death,'--.')
    xlabel('Days Tracked')
    ylabel('Total Deaths')
    title('Total Deaths Against Days Tracked')
    grid on
end
% Putting a legend at the northwest corner
legend(key_locations,'Location','nw')
hold off

% Printing a statement
fprintf('Vietnam has best suppresed the COVID-19 virus as the total cases and the total deaths is the lowest compared to the other 5 countries\n');



