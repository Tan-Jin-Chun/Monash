% Written by Tony Vo, Modified by:Soon Foo Chong
clear all; close all; clc;
%%
% %importdata()
% data_file = importdata('lab4_plot_data3.txt');
% x = data_file(1,:);   % x-coordinate data
% y = data_file(2,:);   % y-coordinate data
% z = data_file(3,:);   % z-coordinate data
% t = data_file(4,:);   % t-coordinate data
%% part 1
data_file = fopen('lab4_plot_data3.txt','r');
x = str2num(fgetl(data_file));   % x-coordinate data
y = str2num(fgetl(data_file));   % y-coordinate data
z = str2num(fgetl(data_file));   % z-coordinate data
t = str2num(fgetl(data_file));   % t-coordinate data
fclose(data_file);

%% part 2
subplot(3,1,1)
plot(x, y, 'ro');
xlabel('x'); 
ylabel('y');
hold on
plot(x,sin(x),'k');
legend('noisy data','sin(x)','location','se')

%% part 3
subplot(3,1,2)
plot(x, z, 'bd');
xlabel('x'); 
ylabel('z');
hold on
plot(x,cos(x),'k');
legend('noisy data','cos(x)','location','se')

%% part 4
subplot(3,1,3)
plot(x, t, 'g*');
xlabel('x'); 
ylabel('t');
hold on
plot(x,tan(x),'k');
legend('noisy data','tan(x)','location','se')