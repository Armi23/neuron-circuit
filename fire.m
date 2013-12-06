function result = fire(circuit,firing,threshold)

[m,~] = size(circuit);
result = zeros(m,1);

for i = 1:m
    synapses = circuit(i,:);
    potential = synapses * firing;
    
    if potential >= threshold
        result(i) = 1;
    end
    
end