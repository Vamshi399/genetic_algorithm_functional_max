% Printing algorithm iterative process
% generation_size: Number of iterations

function plotGA(generation_size)
global fitness_average;
x = 1:1:generation_size;
y = fitness_average;
plot(x,y)
