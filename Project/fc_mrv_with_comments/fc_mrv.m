function [newSolution, numCalls, space] = fc_mrv(currDomain, solution, row, column)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description:After we have put our current queen in available position we 
    % update the currDomain and we search for next queen that has the minimum #
    % of rows.If exists more than one then we choose random.
    %
    % Parameters :
    %              currDomain is a matrix with all available rows(positions 
    %              with not any conflicts) for all queens
    %                 
    %              solution is the vector that shows where we had put each queen,            
    %              ex:solution=[...0...],means that in i-th queen we
    %              haven't assigned any position yet.
    %
    %              row is the position of my current queen,
    %              
    %              column is my current queen 
    %               
    % 
    % Return     :
    %               [the appropriate row for each queen to avoid conflicts,
    %               #of calls until it find a solution or not,space complexity]


    n = length(solution);
    unassigned = find(solution==0);
    numCalls = n;
    
    space = n^2 + 3*n;%complexity

    for i_unassigned = unassigned%check for each unassigned queen all her available positions
        currDomain = updateDomain(currDomain, row, column, i_unassigned);
        numCalls = numCalls + n;
        
        if sum(currDomain(:,i_unassigned))==0%hasn't any available positions
            newSolution = [];
            return
        end
    end
    if (isempty(unassigned))%we had put all the queens in positions(rows)
        newSolution = solution;
        return
    end
    
    newColumn = mrv(currDomain, solution);%apply mrv to choose random next queen
    numCalls = numCalls + n;
    
    availableRows = find(currDomain(:,newColumn) == 1)';
    numCalls = numCalls + n;
    
    for newRow = availableRows
        solution(newColumn) = newRow;%put our next queen to position and become current queen
        [newSolution, newCalls, newSpace] = fc_mrv(currDomain, solution, newRow, newColumn);
        space = space + newSpace;
        numCalls = numCalls + newCalls;
        if newSolution
            return
        end
    end
    return
end