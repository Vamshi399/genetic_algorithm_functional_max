% Initial population
% population_size: Population size
% chromosome_size: Chromosome length

function init(population_size, chromosome_size)
global population;
for i=1:population_size
    for j=1:chromosome_size
        % Assign a value to the i row and j column of the population
        population(i,j) = round(rand);  % rand generates a random number between (0,1), round() is a rounding function
    end
end
clear i;
clear j;

