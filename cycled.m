function cycle = cycled(computation,result)

[~,n] = size(computation);
cycle = 0;

for i = 1:n
    col = computation(:,i);
    
    if (isequal(result,col))
        cycle = 1;
    end
end
