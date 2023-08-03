% Written by Tan Jin Chun (32194471)
% Last Modified: 12/5/22
% Q3c

clear all;close all;clc

%parameters
% Initializing my parameters (Instructions given in the assignment sheet)
% My student ID is 32194471
N = 5;
m = 100*[9,4,4,7,1]; % part (a) and later part (e)
k = 10000*ones(1,N); % part (a) and later part (e)
c = 200*ones(1,N);   % part (a) and later part (e)

%PS you may need to add more lines here to complete part (e). Please
%indicate these new lines with a comment.

% Using diag to create diagonal matrices
M = diag(m);                                                     % part (a)
K = diag(-k-[k(2:end),0]) + diag(k(2:end),1) + diag(k(2:end),-1);% part (a)
C = diag(-c-[c(2:end),0]) + diag(c(2:end),1) + diag(c(2:end),-1);% part (a)

% Given Values
a = 0.3; omega = 3;
f = @(t) [a*cos(omega*t);zeros(N-1,1)];

% X'' = M^{-1}KX + M^(-1)CX'+F, X(0)=0 and X'(0)=0
% Rewrite this equation so that it is in the form x' = [X;X']' = Ax + F(t)
% by finding A (I have supplied F and the initial condition for you)
A = [zeros(N,N),eye(N,N); M^(-1)*K,M^(-1)*C];  % part (a)
F = @(t) [zeros(N,1); f(t)];

%initial condition
x0 = zeros(2*N,1);

%rate of change of state x
RHS = @(x,t) A*x + F(t);

%solver parameters and domain  
Nt = 300;
tmax = 10;
t = linspace(0,tmax,Nt);
dt = t(2)-t(1);
x = zeros(2*N,Nt); %here we store the solution at each timestep in separate (Nt) columns
 
 %set initial condition to solution in first column
 x(:,1) = x0;

 %iterate Eulers method for every timestep and later iterate Heun's method
 %for accuracy.
 for i = 2:Nt

    x(:,i) = x(:,i-1) + dt* RHS(x(:,i-1),t(i-1)); % part (b) and then part (d) (two different codes, you will probably use more than one line for part (d))

 end
 
 % No Changes Made to the code below except for "displacement" and
 % rectification of xpos and also the addition of two yline to indicate the
 % threshold
 % Create animation of building --- you do not need to touch this.
 xpos = x(1:N,:);
 halfwidth = 0.3;
 figure(1),
 for i = 1:Nt
    cla, hold on
     plot(xpos(:,i)-halfwidth,[1:N],'b')
     plot(xpos(:,i)+halfwidth,[1:N],'b')
     plot([0, xpos(1,i)]+halfwidth,[0, 1],'b')
     plot([0, xpos(1,i)]-halfwidth,[0, 1],'b')
     for j = 1:N
         plot([xpos(j,i)+halfwidth, xpos(j,i)-halfwidth],[j, j],'b')
         plot([xpos(j,i)+halfwidth, xpos(j,i)-halfwidth],[j, j],'b')
     end
     
     axis equal
     xlim([-1 1])
     ylim([0 N])
 drawnow
 end
 
 
 %Create figure showing the inter-floor displacement from each floor to the
 %floor below it (in the case of Floor 1, it is the displacement of Floor 1
 %compared to the ground).
 figure (2)
 cla
 hold on
 displacement = x(1:N,:) - [zeros(1,Nt); x(1:N-1,:)];%part c
 for i = 1:N
     plot(t' ,displacement(i,:),'LineWidth',3)
 end
 newcolors = {'#F00','#F80','#FF0','#0B0','#00F'};
 colororder(newcolors)

 % Added Code
 yline(0.04,'k--','Threshold', 'LineWidth',2);
 yline(-0.04,'k--','Threshold','LineWidth',2);
 legend('Floor 1','Floor 2','Floor 3','Floor 4','Floor 5','Positive Threshold','Negative Threshold');
 