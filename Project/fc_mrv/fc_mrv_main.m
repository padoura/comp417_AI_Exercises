function [newSolution, numCalls, space] = fc_mrv_main(n)
    solution = zeros(1,n);
    currDomain = ones(n);
    column = randi(n); %choose a random column to start
    numCalls = 0;
    
    space = n^2 + 2*n;
    
    for row = 1:n
        solution(column) = row;
        [newSolution, newCalls, newSpace] = fc_mrv(currDomain, solution, row, column);
        space = space + newSpace;
        numCalls = numCalls + newCalls;
        if newSolution
            return
        end
    end
end