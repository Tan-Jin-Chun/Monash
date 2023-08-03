%Written by: Tony Vo
clear all; close all; clc;

%variables
mass = linspace(50,100,7);
k = 0.12;
n=0.9;

%freefall function
[vt,yt] = freefall(mass,k,n);

%% plotting
subplot(2,1,1)
plot(mass,vt,'k-')
xlabel('mass (kg)')
ylabel('v_T (m/s)')

subplot(2,1,2)
plot(mass,yt,'bo')
xlabel('mass (kg)')
ylabel('y_T (m)')

%% printing
%creating matrix containing all of the variables
all_info = [mass' vt' yt'];

%fprintf to text file
filename = 'skydivers.txt';
fid = fopen(filename,'w');
fprintf(fid,'%10s %10s %10s\n', 'mass (kg)', 'vt (m/s)', 'yt (m)');
fprintf(fid,'%10.2f %10.2f %10.2f\n',all_info');
fclose(fid);
