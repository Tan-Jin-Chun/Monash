function [C,h] = cost_tank(r,V)
% computes cost of tank with input r and V

% Input Arguments
% ---
% r - radius
% V - volume
%
% Return Values
% ---
% C - cost of tank
% h - height of the tank

h = V ./ (4/3*pi*r.^2);

C = 2*pi*r.*h*400 + (pi*r).*sqrt(r.^2+h.^2)*600;
