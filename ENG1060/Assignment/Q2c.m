% Q2c

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 4/1/2021

fprintf('\n Q2c \n\n')

%% code starts here
% Variables
xl = -2; % Lower limit for x
xu = 10; % Upper limit for x
yl = -8; % Lower limit for y
yu = 12; % Upper limit for y

% Equation (function handle)
T = @(x,y) y.*cos(x) - x.*sin(y) - 3*cos(x.*y/3).*sin(x.*y/5).^2;

% Total surface area of the metal plate (Assuming square section and taking x and y  to find the area)
Area = (xu-xl)*(yu-yl);

% Average Temperature using Matlab's In-built Integral2 function
Avg_temp_Matlab = integral2(T,xl,xu,yl,yu)/Area ;

% Error that is required
error = 4e-6;

% Initial Number of points to start the for loop 
% It starts with three as this is the minimum number of points required for
% Composite Simpson's 1/3 rule
n = 3;

% This is to start the loop
error_diff = 1;

% Preallocating for efficiency purposes
Ix = zeros(length(n));

% Using a while loop to continue to iterate until the requirement is
% obtained (precision must be equal to 4x10^6)
while (error_diff > error)
    
    % Update the number of points after the the loop has finished one
    % iteration
    n = n + 2;
    
    % x points and y points (linearly-spaced)
    x = linspace(xl,xu,n);
    y = linspace(yl,yu,n);
    
    %Using a for loop to evaluate the inner integral along the x dimension
    %for each value of y. 
    for i = 1:n
        Ix(i) = comp_simp13_vector(x,T(x,y(i))); %Must make Ix a vector
    end
    
    %The resulting integral from above is then use to be integrated along
    %the y-dimensions
    Ixy = comp_simp13_vector(y,Ix);
    
    % Calculating the average temperature
    avg_temp_comp13 = Ixy/Area ;
    
    %Calculating the error
    error_diff = abs(avg_temp_comp13 - Avg_temp_Matlab); %Must be put here instead of downthere
end

% Doing exactly the same as above. The only thing that is different is the
% number of points to start with and the way the number of points is
% updated

% Minimum number of points to get started
% Must be 4 as this is the minimum number of point required for
% Composite Simpson's 3/8 rule
n2 = 4;

% Preallocate for efficiency purpose
Ix2 = zeros(length(n2));

% A false start 
error_diff = 1;

% Using a while loop to continue to iterate until the requirement is
% obtained (precision must be equal to 4x10^6)
while (error_diff > error)
    
    % Update the number of points after the the loop has finished one
    % iteration
    n2 = n2 + 3;
    
    % x points and y points (linearly-spaced)
    x2 = linspace(xl,xu,n2);
    y2 = linspace(yl,yu,n2);
    
    %Using a for loop to evaluate the inner integral along the x dimension
    %for each value of y. 
    for i = 1:n2
        Ix2(i) = comp_simp38_vector(x2,T(x2,y2(i)));
    end
    
    Ixy2 = comp_simp38_vector(y2,Ix2);
    avg_temp_comp38 = Ixy2/Area ;
    error_diff = abs(avg_temp_comp38 - Avg_temp_Matlab);
end

% Printing out the avg_temp_Matlab and the method which require lesser
% number of spaced points 
% fprintf("The average temperature calculated using Matlab's In-built function is %.4f\n",Avg_temp_Matlab);
% fprintf("The average temperature calculated using Simpson's 1/3 rule is %.4f\n",avg_temp_comp13);
% fprintf("The average temperature calculated using Simpson's 1/3 rule is %.4f\n",avg_temp_comp13);
% fprintf("The mininmum number of points required for Simpson's 1/3 rule is %.f\n",n);
% fprintf("The minimum number of points required for Simpson's 3/8 rule is %.f\n",n2);

% Using an if statement to determine which method requires the less number
% of spaced points
if n > n2
    fprintf("The Compsite Simpson's 3/8 rule requires only %.f of spaced points to obtain the average temperature of %f\n",n2,avg_temp_comp38);
elseif n2 > n
    fprintf("The Compsite Simpson's 1/3 rule requires only %.f of spaced points to obtain the average temperature of %f\n",n,avg_temp_comp13);
else
    fprintf('Both method requires the same number of points which is %.f to obtain the average temperature which is %f',n,avg_temp_comp38);
end


  








