function [solution, negDiagQueens, posDiagQueens, rowQueens, conflicts] =...
                updateState(solution, column, row, negDiagQueens, posDiagQueens, rowQueens, conflicts)
    %  File    :   run_n_queens
    % 
    %      Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: We remove our queen(column) from her current position(row) and
    % we subtrack conflicts that we have in this state and we placed in
    % the row position and we add conflicts if we have another queens
    % attacked in the row that belong now.The same with the diagonals.
    % 
    %   
    %
    % Parameters :
    %              
    %              solution is the vector that decribes the current state
    %              
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
    %              conflicts is the number of directs conflicts for current
    %              state
    %
    
    % Return     :
    %             solution, diagonal and row arrays and conflicts
    
                
    n = length(solution);
    
    %Update conflicts in current negative diagonal
    diagonal = column-solution(column)+n;
    if negDiagQueens(diagonal) > 1
        negDiagQueens(diagonal) = negDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        negDiagQueens(diagonal) = 0;
    end

    %Update conflicts in current positive diagonal
    diagonal = column+solution(column)-1;
    if posDiagQueens(diagonal) > 1
        posDiagQueens(diagonal) = posDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        posDiagQueens(diagonal) = 0;
    end
    
    %Update conflicts in current row
    currRow = solution(column);
    if rowQueens(currRow) > 1
        rowQueens(currRow) = rowQueens(currRow) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that row
        rowQueens(currRow) = 0;
    end
    
    %change row
    solution(column) = row;
    
    %Update conflicts in new negative diagonal
    diagonal = column-row+n;
    if negDiagQueens(diagonal) > 0
        negDiagQueens(diagonal) = negDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        negDiagQueens(diagonal) = 1;
    end

    %Update conflicts in new positive diagonal
    diagonal = column+row-1;
    if posDiagQueens(diagonal) > 0
        posDiagQueens(diagonal) = posDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        posDiagQueens(diagonal) = 1;
    end
    
    %Update conflicts in new row
    if rowQueens(row) > 0
        rowQueens(row) = rowQueens(row) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that row
        rowQueens(row) = 1;
    end  
    
end