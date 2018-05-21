function [solution, negDiagQueens, posDiagQueens, rowQueens, conflicts] =...
                updateState(solution, column, row, negDiagQueens, posDiagQueens, rowQueens, conflicts)
                
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