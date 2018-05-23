function newSolution = fc_mrv_main(n)
    solution = zeros(1,n);
    currDomain = ones(n);
    column = randi(n); %choose a random column to start
    for row = 1:n
        solution(column) = row;
        newSolution = fc_mrv(currDomain, solution, row, column);
        if newSolution
            return
        end
    end
end