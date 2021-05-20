% Single point crossover operation
% population_size
% chromosome_size
% cross_rate

function crossover(population_size, chromosome_size, cross_rate)
global population;

% The step size is 2 to traverse the population
for i=1:2:population_size
    % rand<crossover probability, crossover operation is performed on the chromosome strings of two individuals
    if(rand < cross_rate)
        cross_position = round(rand * chromosome_size);
        if (cross_position == 0 || cross_position == 1)
            continue;
        end
        % Exchange cross_position and subsequent binary strings
        for j=cross_position:chromosome_size
            temp = population(i,j);
            population(i,j) = population(i+1,j);
            population(i+1,j) = temp;
        end
    end
end


clear i;
clear j;
clear temp;
clear cross_position;

