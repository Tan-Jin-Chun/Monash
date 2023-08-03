% Written by Tan Jin Chun (32194471)
% Last Modified: 23/4/2022
% Assignment 2 Question 2

clc;clear;close all

% Given variables and equations
D = 3;
alpha = 1;
u = @(x,y,z,t,D,alpha) 1/(4*pi*D*t) * exp(-(x^2+y^2)/(4*D*t) - alpha*z/D);

% Modified Section
% You will need a function which returns the grad of u -- it is a vector.
gradu = @(x,y,z,t,D,alpha) [(-x/(2*D*t))*u(x,y,z,t,D,alpha); ...
(-y/(2*D*t))*u(x,y,z,t,D,alpha); ...
 (-alpha/D)*u(x,y,z,t,D,alpha)];
% -----------------------------------------------------------------------

% My ID is 32194471
% 50 intervals in each dimension of the room to discretise the room
N = 50;

% The boundary conditions for x, y and z
xmin = 1; %last number in ID
xmax = xmin+2;
x = linspace(xmin,xmax,N+1);
hx = x(2)-x(1);
ymin = 7; %second last number in ID
ymax = ymin+3;
y = linspace(ymin,ymax,N+1);
hy = y(2)-y(1);
zmin = 0;
zmax = 3;
z = linspace(zmin,zmax,N+1);
hz = z(2)-z(1);

x = x(1:end-1)+hx/2;
y = y(1:end-1)+hy/2;
z = z(1:end-1)+hz/2;

tmin = 0;
tmax = 20;
Nt = 200;
t = linspace(tmin,tmax,Nt+1); t = t(2:end);        
        
%% ----- Volume Integral (Part a) ------------------------------------------
rho = zeros(Nt,1);

for n = 1:Nt
    
    %Calculate the volume integral at time t(n) and enter it as the value
    %rho(n)

% Modified Section --------------------------------------------------------
    % First, we would need to initialise the value of total mass of smoke
    tot_mass_smoke = 0;

    % We will be using three for loops here to approximate the total mass
    % of smoke at any moment of time (basically using the summation formula
    % shown in the assignment 2 notes)
    for i = x
        for j = y
            for k = z
                tot_mass_smoke = tot_mass_smoke + (u(i,j,k,t(n),D,alpha) * hx * hy * hz);
            end
        end
    end

    % Assigning the value to rho before zeroing it to update the value
    rho(n) = tot_mass_smoke;
    
end

%-------------------------------------------------------------------------

% Plotting the figure
figure(1)
cla
plot(t,rho)
hold on

% % Plotting the line where the smoke detection in the living room activates
% % if the total smoke mass in the living room, p is larger than 0.015
yline(0.015,'g');

% Labelling the figure
xlabel("t");
ylabel("rho(t), phi(t)");
title("Plot of rho(t) and phi(t) against t");


%% ---- Flux (Part b)------------------------------------------------------
% Initialising the value of phi
phi = zeros(Nt,1);

for n = 1:Nt
 
    %Calculate the flux integral at time t(n) and enter it as the value
    %phi(n)

% Modified Section--------------------------------------------------------

    % We can calculate the flux for each separate wall with the formula
    % given in the assignent sheet

    % Initialising the variables for the flux of the wall
    flux_wall_1 = 0;
    flux_wall_2 = 0;
    flux_wall_3 = 0;
    flux_wall_4 = 0;

    % Initialising the variable for the normal
    normal_1 = [-1,0,0];
    normal_2 = [0,-1,0];
    normal_3 = [1,0,0];
    normal_4 = [0,1,0];

    % The first wall
    for j = y
        for k = z
            flux_wall_1 = flux_wall_1 + (D * dot(gradu(xmin,j,k,t(n),D,alpha),normal_1) * hy * hz );
        end
    end

    % The second wall
    for i = x
        for k = z
            flux_wall_2 = flux_wall_2 + (D * dot(gradu(i,ymin,k,t(n),D,alpha),normal_2) * hx * hz );
        end
    end
    
    % The third wall
    for j = y
        for k = z
            flux_wall_3 = flux_wall_3 + (D * dot(gradu(xmax,j,k,t(n),D,alpha),normal_3) * hy * hz );
        end
    end

    % The fourth wall
    for i = x
        for k = z
            flux_wall_4 = flux_wall_4 + (D * dot(gradu(i,ymax,k,t(n),D,alpha),normal_4) * hx * hz );
        end
    end

    % Summation of the flux of the walls
    phi(n) = flux_wall_1 + flux_wall_2 + flux_wall_3 + flux_wall_4;
%--------------------------------------------------------------------------

end

% % % Plotting the figure 
% figure(1)
% plot(t,phi,'r')
% plot(t,zeros(length(t),1),'k')
% 
% % Labelling the figure
% % Including the legend
% legend("ρ(t)", "Φ(t)");
% hold off