function [times,nontrivial,logicOut,cycles]=run_neuron(n,threshold,run,i)

% Initialize important return values
times = run;
nontrivial = 0;

% Create trivial vectors for logical output comparison
trivial0 = zeros(4,1);
trivial1 = ones(4,1);

% Create logic based results
logicOR = [1;1;1;0];  
logicAND = [1;0;0;0];
logicNOR = [0;0;0;1]; 
logicNAND = [0;1;1;1];
logicXOR =  [0;1;1;0];
logicXNOR = [1;0;0;1];
logicOut = zeros(6,1);

% Initialize firing of input neurons
firing1 =  zeros (n,1);
firing2 =  zeros (n,1);
firing3 =  zeros (n,1);
firing4 =  zeros (n,1);

% 1,1
firing1(1,1) = 1;
firing1(2,1) = 1;
firing1(3,1) = 1;

% 1,0
firing2(1,1) = 1;
firing2(2,1) = 1;
firing2(3,1) = 0;

% 0,1
firing3(1,1) = 1;
firing3(2,1) = 0;
firing3(3,1) = 1;

% 0,0
firing4(1,1) = 1;
firing4(2,1) = 0;
firing4(3,1) = 0;

cycles = zeros(1,4);

for j = 1:run
    j
    i
    % Create random circuit based on input size each time
    circuit = make_circuit(n);
    
    [fired1,~,cycled1] = neuron_circuit(n,threshold,circuit,firing1);
    [fired2,~,cycled2] = neuron_circuit(n,threshold,circuit,firing2);
    [fired3,~,cycled3] = neuron_circuit(n,threshold,circuit,firing3);
    [fired4,~,cycled4] = neuron_circuit(n,threshold,circuit,firing4);
    
    result = [fired1;fired2;fired3;fired4];
    cycles(1,1) = cycles(1,1) + cycled1;
    cycles(1,2) = cycles(1,2) + cycled2;
    cycles(1,3) = cycles(1,3) + cycled3;
    cycles(1,4) = cycles(1,4) + cycled4;
    
    
    if (~isequal(trivial1,result) & ~isequal(trivial0,result))
        nontrivial = nontrivial + 1;
        
        if (isequal(result,logicAND))
            logicOut(1,1)  = logicOut(1,1) + 1;
        elseif (isequal(result,logicNAND))
            logicOut(2,1)  = logicOut(2,1) + 1;
        elseif (isequal(result,logicOR))
            logicOut(3,1)  = logicOut(3,1) + 1;
        elseif (isequal(result,logicNOR))
            logicOut(4,1)  = logicOut(4,1) + 1;
        elseif (isequal(result,logicXOR))
            logicOut(5,1)  = logicOut(5,1) + 1;
        elseif (isequal(result,logicXNOR))
            logicOut(6,1)  = logicOut(6,1) + 1;
        end 
    end    
end