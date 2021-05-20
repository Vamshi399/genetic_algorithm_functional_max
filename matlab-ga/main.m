% Set the parameters of the genetic algorithm and test the effect
% Set the solution accuracy to 4 decimal places

function main()
elitism = true;             % Select elite operation
population_size = 100;      % Population size
chromosome_size = 17;       % Chromosome length
generation_size = 200;      % The maximum number of iterations
cross_rate = 0.6;           % Crossover probability
mutate_rate = 0.01;         % Mutation probability

[best_individual,best_fitness,iterations,x] = genetic_algorithm(population_size, chromosome_size, generation_size, cross_rate, mutate_rate,elitism);

disp Optimal individual:
best_individual
disp Optimal fitness:
best_fitness
disp The optimal individual corresponds to the value of the independent variable:
x
disp Number of iterations to achieve optimal results:
iterations

clear;