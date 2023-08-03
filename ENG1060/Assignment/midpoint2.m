function [t,q,z] = midpoint2(dqdt,dzdt,tspan,q0,z0,h)
% [t,y] = midpoint(dqdt,dzdt,tspan,q0,z0,h):
% Written by: Tan Jin Chun, ID: 32194471
% Last modified: 11/1/2021

% General Purpose of this function file
% This function will take in a function handle,a tspan which consists of an
% initial value and a final value, an initial value of the dependent
% variable and the step size to produce the output of t which is the vector
% of independent variable and y is the vector of solution for dependent
% variable

% INPUTS:
%  - dqdt = first function handle of the first ODE, f(z)
%  - dzdt = second function handle of the first ODE, f(q)
%  - tspan = [<initial value>, <final value>] of independent variable
%  - q0 = initial value of first dependent variable
%  - z0 = initial value of second dependent variable
%  - h = step size

% OUTPUTS:
%  - t = vector of independent variable
%  - q = vector of solution for first dependent variable
%  - z = vector of solution for second dependent variable

% Error checking for tspan
if ~(tspan(2)>tspan(1))
    error('upper limit must be greater than lower')
end

% Create t as a column vector (discretise t)
t = (tspan(1):h:tspan(2))'; %column vector
n = length(t); %number of points 

% If necessary, add an additional t so that range goes up to tspan(2)
if t(n)<tspan(2)
    t(n+1) = tspan(2);
    n = n+1;
end

%% Editing of code should start here (The above code is to check whether the initial conditions are met)

% Preallocate y using the size of t column vector for effieciency purpose
q = q0*ones(size(t));
z = z0*ones(size(t));
%OR y = y0*ones(n,1) 

% Implement Euler's method
% Or y(i+1) = y(i) + dydt(t(i),y(i))*(t(i+1)-t(i));

for i = 1:n-1
    % To recalculate the step size , ensure that we are using the step size correctly
    h = t(i+1) - t(i); 
    thalf = t(i) + h/2;
    qhalf = q(i) + h/2*dqdt(t(i),q(i),z(i)); %Equation 1
    zhalf = z(i) + h/2*dzdt(t(i),q(i),z(i));  %Equation 2
    q(i+1) = q(i) + h*dqdt(thalf,qhalf,zhalf); % Must take into account three variables
    z(i+1) = z(i) + h*dzdt(thalf,qhalf,zhalf);
end


end