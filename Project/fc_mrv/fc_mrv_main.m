function newSolution = fc_mrv_main(n)
    solution = zeros(1,n);
    currDomain = ones(n);
    for row = 1:n
        solution(1) = row;
        newSolution = fc_mrv(currDomain, solution, row, 1);
%         test = [solution row]
        if newSolution
            return
        end
    end
end