clear;
close all;

D = 3;
alpha = 1;
u = @(x,y,z,t,D,alpha) 1/(4*pi*D*t) * exp(-(x^2+y^2)/(4*D*t) - alpha*z/D);
% You will need a function which returns the grad of u -- it is a vector.
         gradu = @(x,y,z,t,D,alpha) [(-x/(2*D*t))*u(x,y,z,t,D,alpha); ...
                                     (-y/(2*D*t))*u(x,y,z,t,D,alpha); ...
                                     (-alpha/D)*u(x,y,z,t,D,alpha)];


N = 50;
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
        
% ----- Volume Integral (Part a) -----
rho = zeros(Nt,1);

for n = 1:Nt
    
    %Calculate the volume integral at time t(n) and enter it as the value
    %rho(n)
    total_smoke = 0;
    for i = x
        for j = y
            for k = z
                total_smoke = total_smoke + ( u(i,j,k,t(n),D,alpha) * hx * hy *hz );
            end
        end
    end
    rho(n) = total_smoke;
end

figure(1)
cla
plot(t,rho)
hold on




% ---- Flux (Part b)-----
phi = zeros(Nt,1);

for n = 1:Nt
 
    %Calculate the flux integral at time t(n) and enter it as the value
    %phi(n)

    flux_wallA = 0;
    normalA = [-1,0,0];
    for j = y
        for k = z
            flux_wallA = flux_wallA + ( D * dot(gradu(xmin,j,k,t(n),D,alpha),normalA) * hy * hz );
        end
    end

    flux_wallB = 0;
    normalB = [0,-1,0];
    for i = x
        for k = z
            flux_wallB = flux_wallB + ( D * dot(gradu(i,ymin,k,t(n),D,alpha),normalB) * hx * hz );
        end
    end

    flux_wallC = 0;
    normalC = [1,0,0];
    for j = y
        for k = z
            flux_wallC = flux_wallC + ( D * dot(gradu(xmax,j,k,t(n),D,alpha),normalC) * hy * hz );
        end
    end

    flux_wallD = 0;
    normalD = [0,1,0];
    for i = x
        for k = z
            flux_wallD = flux_wallD + ( D * dot(gradu(i,ymax,k,t(n),D,alpha),normalD) * hx * hz );
        end
    end

    phi(n) = flux_wallA + flux_wallB + flux_wallC + flux_wallD;
end

figure(1)
plot(t,phi,'r')
plot(t,zeros(length(t),1),'k')