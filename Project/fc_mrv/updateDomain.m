function currDomain = updateDomain(currDomain, row, column, unassignedColumn)
%  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: Checks each position of an unassigned queen for conflicts
    %             
    % Parameters :
    %              currDomain is a matrix with all valid rows for all queens. If
    %              currDomain(i,j)=0 means i-th row for j queen has conflicts
    %              and is not a valid position, else currDomain(i,j)=1 means
    %              it is a valid position.
    
    %              row of newly assigned queen
    %
    %              column of the queen
    %
    %              unassignedColumn refers to the a not yet unassigned queen
    % Return     :
    %              the updated currDomain matrix
    
    for unassignedRow = 1:size(currDomain,1)
       if(currDomain(unassignedRow, unassignedColumn) ==1) % all valid rows
        if (isConflicted(row, column, unassignedRow, unassignedColumn))
            currDomain(unassignedRow, unassignedColumn) = 0;
        end
       end
    end
end                                 