function [newSolution, numCalls] = fc_mrv_main(n)
    solution = zeros(1,n);
    currDomain = ones(n);
    column = randi(n); %choose a random column to start
    numCalls = 0;
    for row = 1:n
        solution(column) = row;
        [newSolution, newCalls] = fc_mrv(currDomain, solution, row, column);
        numCalls = numCalls + newCalls;
        if newSolution
            return
        end
    end
end