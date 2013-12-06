function circuit = make_circuit(n)

% Create random circuit based on input size
circuit = zeros(n);
for i = 4:n
    for j = 1:n
        if i ~= j
            circuit(i,j) = connect(); 
        end
    end
end