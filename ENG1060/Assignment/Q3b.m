% Q3b

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 12/01/2021

fprintf('\n Q3b \n\n')

%% code starts here
% Initial Conditions
q0 = 0;
z0 = 8;

% Parameters given
R = 0.4;
C = 0.5;
L = 0.2;
Et = 50;

% Time step size
h = [0.2 0.1 0.05];
tspan = [0 10];

% Equations given
dqdt = @(t,q,z) z ;
dzdt = @(t,q,z) (-R*z - (1/C)*q + Et)./L ;

% Given command
colours = 'rbk';

% Plotting the graph for different step size using a for loop to go through
% each value of h
% Calling figure 5
figure(5) 
for i = 1:length(h)
    subplot(2,1,1)
    % Calling the function
    [t,q,z] = midpoint2(dqdt,dzdt,tspan,q0,z0,h(i));
    hold on
    plot(t,q,'Color',colours(i))
    xlabel('t')
    ylabel('q')
    title('q against t')
end
legend('h = 0.2','h = 0.1','h = 0.05')
hold off

% Second subplot
for i = 1:length(h)
    %Calling the function
    [t,q,z] = midpoint2(dqdt,dzdt,tspan,q0,z0,h(i));
    subplot(2,1,2)
    hold on
    plot(t,z,'Color',colours(i))
    xlabel('t')
    ylabel('dqdt')
    title('dqdt against t')
end
legend('h=0.2','h=0.1','h=0.05')
hold off


