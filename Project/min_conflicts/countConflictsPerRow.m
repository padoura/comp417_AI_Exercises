function conflictDiff = countConflictsPerRow(column, row,...
                    negDiagQueens, posDiagQueens, rowQueens, solution)
                
    n = length(solution);
    conflictDiff = 0;
    
    %Check how conflicts change in current negative diagonal
    diagonal = column-solution(column)+n;
    if negDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end

    %Check how conflicts change in current positive diagonal
    diagonal = column+solution(column)-1;
    if posDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    
    %Check how conflicts change in current row
    if rowQueens(solution(column)) > 1
        conflictDiff = conflictDiff - 1;
    end
    
    %Check how conflicts change in new negative diagonal
    diagonal = column-row+n;
    if negDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end

    %Check how conflicts change in new positive diagonal
    diagonal = column+row-1;
    if posDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    
    %Check how conflicts change in new row
    if rowQueens(row) > 0
        conflictDiff = conflictDiff + 1;
    end         
    
end