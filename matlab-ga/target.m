% MATLAB's GA tool only finds the (approximate) minimum value of the function, and the objective function needs to be inverted
function [ y ] = target(x)
y = -x-10*sin(5*x)-7*cos(4*x);
end

