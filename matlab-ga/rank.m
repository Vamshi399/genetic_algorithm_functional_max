% Sort individuals according to their fitness and save the best individuals
% population_size: Population size
% chromosome_size: Chromosome length

function rank(population_size, chromosome_size)
global fitness_value;   % Population fitness
global fitness_sum;     % Population accumulative fitness
global fitness_average;
global best_fitness;
global best_individual;
global best_generation;
global population;
global G;

for i=1:population_size    
    fitness_sum(i) = 0.;
end

min_index = 1;
temp = 1;
temp_chromosome(chromosome_size)=0;

% Traverse the population 
% Bubble Sort
% Finally, the fitness of population(i) increases as i increases, population(1) is the smallest, and population(population_size) is the largest
for i=1:population_size
    min_index = i;
    for j = i+1:population_size
        if fitness_value(j) < fitness_value(min_index);
            min_index = j;
        end
    end
    
    if min_index ~= i
        % Exchange the values ​​of fitness_value(i) and fitness_value(min_index)
        temp = fitness_value(i);
        fitness_value(i) = fitness_value(min_index);
        fitness_value(min_index) = temp;
        % At this time, the fitness of fitness_value(i) is the smallest on [i,population_size]
        
        % Exchange the chromosome strings of population(i) and population(min_index)
        for k = 1:chromosome_size
            temp_chromosome(k) = population(i,k);
            population(i,k) = population(min_index,k);
            population(min_index,k) = temp_chromosome(k);
        end
    end
end

% fitness_sum(i) = the sum of fitness of the first i individuals
for i=1:population_size
    if i==1
        fitness_sum(i) = fitness_sum(i) + fitness_value(i);    
    else
        fitness_sum(i) = fitness_sum(i-1) + fitness_value(i);
    end
end

% fitness_average(G) = the average fitness of the individual in the G-th iteration
fitness_average(G) = fitness_sum(population_size)/population_size;

% Update the maximum fitness and the corresponding number of iterations, save the best individual (the best individual has the largest fitness)
if fitness_value(population_size) > best_fitness
    best_fitness = fitness_value(population_size);
    best_generation = G;
    for j=1:chromosome_size
        best_individual(j) = population(population_size,j);
    end
end


clear i;
clear j;
clear k;
clear min_index;
clear temp;
clear temp1;
