% Single point mutation operation
% population_size: Population size
% chromosome_size: Chromosome length
% mutate_rate: Mutation probability

function mutation(population_size, chromosome_size, mutate_rate)
global population;

for i=1:population_size
    if rand < mutate_rate
        mutate_position = round(rand*chromosome_size);  % Variation position
        if mutate_position == 0
            % If the mutation position is 0, no mutation
            continue;
        end
        population(i,mutate_position) = 1 - population(i, mutate_position);
    end
end

clear i;
clear mutate_position;

