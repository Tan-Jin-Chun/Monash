% Q3c

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 12/01/2021

fprintf('\n Q3c \n\n')

%% code starts here
% Given command
colourmap = [0 128 128; 128 64 0; 250 128 64;247 129 191]/255; %rgb colour map for ploting
% legend(cellstr(num2str(R', 'R=%.2f'))) (This code is from the email)

% Given variable
R = [0.2 0.5 1 3];
h = 0.05;

figure(6)   % Calling figure 6
% Using a for loop to plot the graph of each value of R as well as the
% colourmap(it is a row vector so must extract the whole row for each iteration)
hold on
for i = 1:length(R)
    dzdt = @(t,q,z) (-R(i)*z - (1/C)*q + Et)./L ;
    [t,q,z] = midpoint2(dqdt,dzdt,tspan,q0,z0,h);
    plot(t,z,'Color',colourmap(i,:))
    xlabel('t')
    ylabel('dqdt')
    title('dqdt against t')
end

%cellstr(A) returns the contents of the dataset A, converted to a cell array of character vectors
%num2str basically converts the number into a string (numeric array into character array)
legend(cellstr(num2str(R', 'R=%.2f'))) %Only works if R is a row vector
hold off


