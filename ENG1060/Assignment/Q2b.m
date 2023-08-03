% Q2b

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 4/1/2020

fprintf('\n Q2b \n\n')

%% code starts here
% Dimesions that are provided
x = linspace(-2,10,127);
y = 2; % Along y which is equal to 2

%Equation given
T = @(x,y) y.*cos(x) - x.*sin(y) - 3*cos(x.*y/3).*sin(x.*y/5).^2;

%Using polyfit and polyval function to fit the line to a certain order
p1 = polyfit(x,T(x,y),3);
p2 = polyfit(x,T(x,y),5);
p3 = polyfit(x,T(x,y),7);

%Creating a 3 by 1 subplot
figure(4)   %calling figure 4
subplot(3,1,1)
plot(x,T(x,y),'r','LineWidth',2)
hold on
plot(x,polyval(p1,x),'b-')
hold off
xlabel('X Dimensions')
ylabel('Temperature')
title('Temperature Of The Plate Along y = 2 (Polynomial Degree 3)')
legend('Line 1','Fitted Line')
grid on

%Plotting the second subplot
subplot(3,1,2)
plot(x,T(x,y),'r','LineWidth',2)
hold on
plot(x,polyval(p2,x),'b-')
hold off
xlabel('X Dimensions')
ylabel('Temperature')
title('Temperature Of The Plate Along y = 2 (Polynomial Degree 5)')
legend('Line 2','Fitted Line')
grid on

%Plotting the third subplot
subplot(3,1,3)
plot(x,T(x,y),'r','LineWidth',2)
hold on
plot(x,polyval(p3,x),'b-')
hold off
xlabel('X Dimensions')
ylabel('Temperature')
title('Temperature Of The Plate Along y = 2 (Polynomial Degree 7)')
legend('Line 3','Fitted Line')
grid on


