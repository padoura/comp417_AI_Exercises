function currDomain = updateDomain(currDomain, row, column, unassignedColumn)
%  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description:for the unassigned queen we check each positions for conflicts
    %             
    % Parameters :
    %              currDomain is a matrix with all available rows(positions 
    %              with not any conflicts) for all queens,if
    %              currDomain(i,j)=0 means i-th row for j queen has conflicts
    %              and is not available,else currDomain(i,j)=1 means
    %              available position.
    
    %              row is the position of queen that has be placed
    %
    %              column is the queen
    %
    %              unassignedColumn is a candidate not be placed yet queen
    % Return     :
    %               the matrix currDomain after we have check the no conflicts positions
    
    for unassignedRow = 1:size(currDomain,1)
       if(currDomain(unassignedRow, unassignedColumn) ==1)%still available position 
        if (isConflicted(row, column, unassignedRow, unassignedColumn))
            currDomain(unassignedRow, unassignedColumn) = 0;
        end
       end
    end
end                                 