
% Q1b

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 4/1/2020

fprintf('\n Q1b \n\n')


%% code starts here
%(Unneccesary variables)
% %Importing the data
% fid = importdata('owid-covid-data-s3.xlsx');
% 
% %Extracting the data
% location = fid.textdata(2:end,3);
% location = string(location);

key_location_My = "Malaysia";

% Comparing the data to extract the variable wanted
x_My = find(strcmpi(key_location_My,location) == 1);
days_trac_My = fid.data(x_My,1);
tot_cases_My = fid.data(x_My,2);

figure(3)  % figure 3
plot(days_trac_My,tot_cases_My,'ro')
xlabel('Days Tracked (Malaysia)')
ylabel('Total Cases of Malaysia')
title('Total Cases of Malaysia Against Days Tracked')

% Period given
t1 = 1:50; 
t2 = 51:145;
t3 = 146:251;
t4 = 252:275;
t5 = 276:317;

% Fitting the curves
% Fitted curve 1
p1 = polyfit(days_trac_My(t1),tot_cases_My(t1),1);
z1 = polyval(p1,days_trac_My(t1));

% Fitted curve 2
p2 = polyfit(days_trac_My(t2),tot_cases_My(t2),1);
z2 = polyval(p2,days_trac_My(t2));

% Fitted curve 3
p3 = polyfit(days_trac_My(t3),tot_cases_My(t3),1);
z3 = polyval(p3,days_trac_My(t3));

% Plotting the exponential curve (curve 4)
ex = days_trac_My(t4);
ey = log(tot_cases_My(t4));
p4 = polyfit(ex,ey,1);
a = exp(p4(2));
b = p4(1);
z4 = a*exp(ex.*b) ;

% Fitted curve 5
p5 = polyfit(days_trac_My(t5),tot_cases_My(t5),2);
z5 = polyval(p5,days_trac_My(t5));

% Plotting the fitted curves
hold on
plot(days_trac(t1),z1,'LineWidth',1)
plot(days_trac(t2),z2,'LineWidth',1)
plot(days_trac(t3),z3,'LineWidth',1)
plot(days_trac(t4),z4,'LineWidth',1)
plot(days_trac(t5),z5,'LineWidth',1)
hold off
legend('Raw Data','1st Fit','2nd Fit','3rd Fit','4th Fit','5th Fit','Location','nw')

% Printing the equation
fprintf('The curve fitting equation for the first period is y = %.2ex - %.2e\n',p1(1),abs(p1(2)));
fprintf('The curve fitting equation for the second period is y = %.2ex - %.2e\n',p2(1),abs(p2(2)));
fprintf('The curve fitting equation for the third period is y = %.2ex + %.2e\n',p3(1),p3(2));
fprintf('The curve fitting equation for the fourth period is y = %.2e e^(%.2ex)\n',a,b);
fprintf('The curve fitting equation for the fifth period is y = %.2ex^2 - %.2ex + %.2e\n',p5(1),abs(p5(2)),p5(3));

