% Roulette selection operation
% population_size: Population size
% chromosome_size: Chromosome length
% elitism: Whether the elite choose

function selection(population_size, chromosome_size, elitism)
global population;      % Previous generation population
global population_new;  % New generation population
global fitness_sum;   % Population accumulation fitness

for i=1:population_size
    r = rand * fitness_sum(population_size);  % Generate a random number between [0, total fitness]
    first = 1;
    last = population_size;
    mid = round((last+first)/2);
    idx = -1;
    
    % Select individuals by arranging the middle method
    while (first <= last) && (idx == -1) 
        if r > fitness_sum(mid)
            first = mid;
        elseif r < fitness_sum(mid)
            last = mid;     
        else
            idx = mid;
            break;
        end
        mid = round((last+first)/2);
        if (last - first) == 1
            idx = last;
            break;
        end
    end
   
   % Generate a new generation of individuals
   for j=1:chromosome_size
        population_new(i,j) = population(idx,j);
   end
end

% Whether the elite choose
if elitism
    p = population_size-1;
else
    p = population_size;
end

for i=1:p
   for j=1:chromosome_size
       % If the elite chooses, update the first population_size-1 individuals in the population, and keep the last best individual
       population(i,j) = population_new(i,j);
   end
end

clear i;
clear j;
clear population_new;
clear first;
clear last;
clear idx;
clear mid;
 

