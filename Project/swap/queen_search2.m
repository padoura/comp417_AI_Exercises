function solution = queen_search2(n)
    C1 = 0.45;
    max_steps = 32*n;
    
    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
    limit = C1 * conflicts;
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
    steps = 0;
    
    while (conflicts > 0)
        while (steps < max_steps)
            for i = find(attackedQueens > 0)
                steps = steps + 1;
                j = randi(n);
                while (j==i)
                    j = randi(n);
                end
                if swapIsBetter(i, j, negDiagQueens, posDiagQueens, solution)
                    [solution, negDiagQueens, posDiagQueens, conflicts] =...
                        performSwap(solution, i, j, negDiagQueens, posDiagQueens, conflicts);
                    if (conflicts == 0)
                        return
                    elseif (conflicts < limit)
                        limit = C1 * conflicts;
                        attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
                        break
                    end
                end
            end
        end
        
        % Reinitialize while loop
        solution = randperm(n);
        [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
        conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
        limit = C1 * conflicts;
        attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
        steps = 0;
    end

end