function boolean = swapIsBetter(i, j, negDiagQueens, posDiagQueens, solution)
    n = length(solution);
    conflictDiff = 0;
    
    %Check how conflicts change in two current negative diagonals
    diagonal = i-solution(i)+n;
    if negDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    diagonal = j-solution(j)+n;
    if negDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end

    %Check how conflicts change in two current positive diagonals
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    
    %swap
    solution([i j]) = solution([j i]);
    
    %Check how conflicts change in two current negative diagonals
    diagonal = i-solution(i)+n;
    if negDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    diagonal = j-solution(j)+n;
    if negDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end

    %Check how conflicts change in two current positive diagonals
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    
    boolean = conflictDiff < 0;
end