function newSolution = fc_mrv(currDomain, solution, row, column)
    for i_unassigned = find(solution==0)
        currDomain = updateDomain(currDomain, row, column, i_unassigned);
        if sum(currDomain(:,i_unassigned))==0
            newSolution = [];
            return
        end
    end
    if (size(find(solution ~= 0),2) == size(solution, 2))
        newSolution = solution;
        return
    end
    newColumn = mrv(currDomain, solution);
    for newRow = find(currDomain(:,newColumn) == 1)'
        solution(newColumn) = newRow;
        newSolution = fc_mrv(currDomain, solution, newRow, newColumn);
        if newSolution
            return
        end
    end
    return
end