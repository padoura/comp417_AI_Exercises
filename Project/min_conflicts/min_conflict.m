function solution = min_conflict(n)
    max_steps = 32*n;

    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
    rowQueens = ones(1,n);
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
    steps = 0;

    while(conflicts > 0)
        while (steps < max_steps)
            steps = steps + 1;
            attackedColumns = find(attackedQueens > 0);
            column = attackedColumns(randperm(length(attackedColumns),1));
            conflictsPerRow = zeros(1,n);
            for row = 1:n
                conflictsPerRow(row) = countConflictsPerRow(column, row,...
                    negDiagQueens, posDiagQueens, rowQueens, solution);
            end
            argmin = datasample(find(conflictsPerRow == min(conflictsPerRow)), 1);
            [solution, negDiagQueens, posDiagQueens, rowQueens, conflicts] =...
                updateState(solution, column, argmin, negDiagQueens, posDiagQueens, rowQueens, conflicts);
            if (conflicts == 0)
                return
            else
                attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
            end
        end
        
        % Reinitialize while loop to secure completeness
        solution = randperm(n);
        [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
        rowQueens = ones(1,n);
        conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
        attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
        steps = 0;
    end
end
                