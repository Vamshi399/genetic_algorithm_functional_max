% Genetic Algorithm for Functional Maximum Problem
% f(x) = x+10*sin(5*x)+7*cos(4*x), x∈[0,9]
% Created by Shengjia Yan @2016/4/26

% population_size: Enter population size
% chromosome_size: Enter chromosome length
% generation_size: Enter the number of iterations
% cross_rate: Enter the cross probability
% mutate_rate: Input mutation probability
% elitism: Whether the input is an elite choice
% m: Best output individual
% n: Optimal output adaptability
% p: Output the number of iterations of the best individual appearance
% q: Output the best individual independent variable value
function [m,n,p,q] = genetic_algorithm(population_size, chromosome_size, generation_size, cross_rate, mutate_rate, elitism)

global G ;              % Current iteration number
global fitness_value;   % Current generation fitness matrix
global best_fitness;    % Best fitness value
global fitness_average; % Average fitness matrix of past dynasties
global best_individual; % The best individual in history
global best_generation; % The best individual is modern
upper_bound = 9;        % Upper bound of the independent variable
lower_bound = 0;        % Lower bound of the interval of the independent variable

fitness_average = zeros(generation_size,1); % Assign the zero matrix of generation_size*1 to fitness_average

disp [ysj genetic algorithm]

fitness_value(population_size) = 0.;
best_fitness = 0.;
best_generation = 0;

init(population_size, chromosome_size); % initialization

for G=1:generation_size   
    fitness(population_size, chromosome_size);              % Calculate fitness 
    rank(population_size, chromosome_size);                 % Sort individuals by fitness
    selection(population_size, chromosome_size, elitism);   % Select action
    crossover(population_size, chromosome_size, cross_rate);% Cross operation
    mutation(population_size, chromosome_size, mutate_rate);% Mutation operation
end

plotGA(generation_size);% Printing algorithm iterative process

m = best_individual;    % Get the best individual
n = best_fitness;       % Get the best fitness
p = best_generation;    % Get the number of iterations when the best individual appears

% To obtain the best individual variable value, for different optimization goals, it needs to be modified here
q = 0.;
for j=1:chromosome_size
    if best_individual(j) == 1
            q = q+2^(j-1);  % Best individual variable binary to decimal
    end 
end
q = lower_bound + q*(upper_bound-lower_bound)/(2^chromosome_size-1); % decoding

clear i;
clear j;


