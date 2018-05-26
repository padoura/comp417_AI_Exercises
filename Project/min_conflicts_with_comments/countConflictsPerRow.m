function conflictDiff = countConflictsPerRow(column, row,...
                    negDiagQueens, posDiagQueens, rowQueens, solution)
    %  File    :   run_n_queens
    % 
    %      Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: We check what happen if we choose this row for our
    % queen,possible to avoid some conflicts and possible to create new
    % conflicts.We calculate the difference of conflicts between the
    % current state and the new state.
    %   
    %
    % Parameters :
    %              column is queen that we will move
    %
    %              row is the candidate positions for our queen
    % 
    %              negDiagQueens is all the diagonals with opposite tendency
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same tendency
    %              with the main diagonal
    %
    %              rowQueens is the vector that show the #of queens to each row               
    %
    %              solution is the vector that decribes the current state
    %
    
    % Return     :
    %             conflictDiff is the difference positive or negative of conflicts
    %             of the current state from the new state,the state we create if
    %             choose this row.        
    %             
                
                
    n = length(solution);
    conflictDiff = 0;
    
    %Check how conflicts change in current negative diagonal
    diagonal = column-solution(column)+n;
    if negDiagQueens(diagonal) > 1 %remove our queen from this diagonal
        conflictDiff = conflictDiff - 1; %less conflict
    end

    %Check how conflicts change in current positive diagonal
    diagonal = column+solution(column)-1;
    if posDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    
    %Check how conflicts change in current row
    if rowQueens(solution(column)) > 1%remove our queen from this row
        conflictDiff = conflictDiff - 1;%less conflict
    end
    
    %Check how conflicts change in new negative diagonal
    diagonal = column-row+n;%we put our queen to this diagonal
    if negDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;%an another one conflict
    end

    %Check how conflicts change in new positive diagonal
    diagonal = column+row-1;
    if posDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    
    %Check how conflicts change in new row
    if rowQueens(row) > 0%we put our queen to this row
        conflictDiff = conflictDiff + 1;%an another one conflict
    end         
    
end