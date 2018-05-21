function conflicts = countDiagConflicts(negDiagQueens, posDiagQueens)
    negDiagQueens = negDiagQueens(negDiagQueens > 0); 
    posDiagQueens = posDiagQueens(posDiagQueens > 0); 
    conflicts = sum(negDiagQueens-1) + sum(posDiagQueens-1);
end