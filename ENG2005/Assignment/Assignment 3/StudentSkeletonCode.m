clear all
close all

%parameters
N = 5;
m = % part (a) and later part (e)
k = % part (a) and later part (e)
c = % part (a) and later part (e)
%PS you may need to add more lines here to complete part (e). Please
%indicate these new lines with a comment.

M = % part (a)
K = % part (a)
C = % part (a)

a = 0.3; omega = 3;
f = @(t) [a*cos(omega*t);zeros(N-1,1)];


% X'' = M^{-1}KX + M^(-1)CX'+F, X(0)=0 and X'(0)=0
% Rewrite this equation so that it is in the form x' = [X;X']' = Ax + F(t)
% by finding A (I have supplied F and the initial condition for you)
A = % part (a)
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
 x(:,i) = % part (b) and then part (d) (two different codes, you will probably use more than one line for part (d))
 end
 
 %Create animation of building --- you do not need to touch this.
 xpos = x(N+1:end,:);
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
 displacement = %part c
 for i = 1:N
     plot(t' ,displacement(i,:),'LineWidth',3)
 end
 newcolors = {'#F00','#F80','#FF0','#0B0','#00F'};
 colororder(newcolors)
 legend('Floor 1','Floor 2','Floor 3','Floor 4','Floor 5');
 
 
