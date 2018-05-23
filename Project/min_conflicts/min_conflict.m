function [solution, numCalls] = min_conflict(n)
    max_steps = 32*n;
    
    %For time cost measurement we assume that each call of checkDiagonals,
    %countDiagConflicts, findAttackedQueens cost n units. +1 for every for
    %loop iteration

    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
    rowQueens = ones(1,n); %each queen starts in a different row
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
    steps = 0;
    
    numCalls = 3*n; % keeps the time cost

    while(conflicts > 0)
        while (steps < max_steps)
            steps = steps + 1;
            attackedColumns = find(attackedQueens > 0);
            column = attackedColumns(randperm(length(attackedColumns),1));
            conflictsPerRow = zeros(1,n);
            for row = 1:n
                conflictsPerRow(row) = countConflictsPerRow(column, row,...
                    negDiagQueens, posDiagQueens, rowQueens, solution);
                
                numCalls = numCalls + 1;
            end
            argmin = datasample(find(conflictsPerRow == min(conflictsPerRow)), 1);
            [solution, negDiagQueens, posDiagQueens, rowQueens, conflicts] =...
                updateState(solution, column, argmin, negDiagQueens, posDiagQueens, rowQueens, conflicts);
            if (conflicts == 0)
                return
            else
                attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
                numCalls = numCalls + n;
            end
        end
        
        % Reinitialize while loop to secure completeness
        solution = randperm(n);
        [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
        rowQueens = ones(1,n);
        conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
        attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
        steps = 0;
        
        numCalls = numCalls + 3*n;
    end
end
                