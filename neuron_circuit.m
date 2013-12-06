function [fired,computation,cycles] = neuron_circuit(n,threshold,circuit,firing)

% Create rest value to compare against
rest = zeros(n,1);

% Fire
result = fire(circuit,firing,threshold);
computation = [];
i = 0;
cycles = 0;

% firing state of output is initial check
fired = result(n,1);

while (~isequal(result,rest) & ~cycled(computation,result))
    % collect history
    computation = horzcat(computation,result);
    
    result = fire(circuit,result,threshold);
    
    % check if output fired
    if (result(n,1) == 1)
        fired = 1;
    end
    
    i = i + 1;
end

if (cycled(computation,result))
   cycles = cycles + 1; 
end

computation = horzcat(computation,result);

