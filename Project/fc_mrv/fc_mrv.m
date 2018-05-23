function [newSolution, numCalls] = fc_mrv(currDomain, solution, row, column)

    n = length(solution);
    unassigned = find(solution==0);
    numCalls = n;

    for i_unassigned = unassigned
        currDomain = updateDomain(currDomain, row, column, i_unassigned);
        numCalls = numCalls + n;
        
        if sum(currDomain(:,i_unassigned))==0
            newSolution = [];
            return
        end
    end
    if (isempty(unassigned))
        newSolution = solution;
        return
    end
    
    newColumn = mrv(currDomain, solution);
    numCalls = numCalls + n;
    
    availableRows = find(currDomain(:,newColumn) == 1)';
    numCalls = numCalls + n;
    
    for newRow = availableRows
        solution(newColumn) = newRow;
        [newSolution, newCalls] = fc_mrv(currDomain, solution, newRow, newColumn);
        numCalls = numCalls + newCalls;
        if newSolution
            return
        end
    end
    return
end