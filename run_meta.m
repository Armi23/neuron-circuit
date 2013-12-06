function [results,percentage,total_cycle,total_logical] = run_meta(bound,threshold,run)

results = zeros(bound,4);
total_cycle = zeros(bound,4);
total_logical = zeros(bound,6);

for i = 4:bound
   i
   [~,nontrivial,logical,cycles]=run_neuron(i,threshold,run,i);
   results(i,1) = i;
   results(i,2) = nontrivial;
   
   
   total_cycle(i,:) = transpose(cycles);
   total_logical(i,:) = logical;
   
%    results(i,3) = logical;
%    results(i,4) = cycles(1,1) + cycles(1,2) + cycles(1,3) + cycles(1,4);
end

percentage = results(:,2)/run;