% Calculate the fitness of individual populations, and modify the following function for different optimization goals
% population_size
% chromosome_size

function fitness(population_size, chromosome_size)
global fitness_value;
global population;

upper_bound = 9;    % Upper bound of the independent variable
lower_bound = 0;    % Lower bound of the interval of the independent variable

% The fitness of all populations is initialized to 0
for i=1:population_size
    fitness_value(i) = 0.;    
end

% f(x) = -x-10*sin(5*x)-7*cos(4*x);
for i=1:population_size
    for j=1:chromosome_size
        if population(i,j) == 1
            fitness_value(i) = fitness_value(i)+2^(j-1);    % The order of population[i] chromosome string and actual binary string of independent variable xi is opposite
        end        
    end
    fitness_value(i) = lower_bound + fitness_value(i)*(upper_bound-lower_bound)/(2^chromosome_size-1);  % Argument xi binary to decimal
    fitness_value(i) = fitness_value(i) + 10*sin(5*fitness_value(i)) + 7*cos(4*fitness_value(i));  % Calculate the fitness function value of the independent variable xi
end

clear i;
clear j;
