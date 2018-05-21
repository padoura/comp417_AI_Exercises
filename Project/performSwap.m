function [solution, negDiagQueens, posDiagQueens, conflicts] = ...
    performSwap(solution, i, j, negDiagQueens, posDiagQueens, conflicts)
    
    n = length(solution);
    
    %Update two current negative diagonals if there are conflicts
    diagonal = i-solution(i)+n;
    if negDiagQueens(diagonal) > 1
        negDiagQueens(diagonal) = negDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        negDiagQueens(diagonal) = 0;
    end
    diagonal = j-solution(j)+n;
    if negDiagQueens(diagonal) > 1
        negDiagQueens(diagonal) = negDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        negDiagQueens(diagonal) = 0;
    end

    %Update two current positive diagonals if there are conflicts
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 1
        posDiagQueens(diagonal) = posDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        posDiagQueens(diagonal) = 0;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 1
        posDiagQueens(diagonal) = posDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        posDiagQueens(diagonal) = 0;
    end
    
    %swap
    solution([i j]) = solution([j i]);
    
    %Update two new negative diagonals if there are conflicts
    diagonal = i-solution(i)+n;
    if negDiagQueens(diagonal) > 0
        negDiagQueens(diagonal) = negDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        negDiagQueens(diagonal) = 1;
    end
    diagonal = j-solution(j)+n;
    if negDiagQueens(diagonal) > 0
        negDiagQueens(diagonal) = negDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        negDiagQueens(diagonal) = 1;
    end

    %Update two new positive diagonals if there are conflicts
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 0
        posDiagQueens(diagonal) = posDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        posDiagQueens(diagonal) = 1;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 0
        posDiagQueens(diagonal) = posDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        posDiagQueens(diagonal) = 1;
    end

end