function [solution, numCalls]  = queen_search2(n)

    %For time cost estimation we assume that each call of checkDiagonals(),
    %countDiagConflicts(), findAttackedQueens(), find(), min(), zeros(),
    %ones(), randperm() cost n units.
    
    %For space cost estimation we count each vector which size depends on
    %n.

    
    %Constants from Sosic and Gu (1991).
    C1 = 0.45;
    max_steps = 32*n;
    
    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
    limit = C1 * conflicts;
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
    steps = 0;
    
    numCalls = 4*n; % keeps the time cost
    
    % keeps the space cost of each array; since it's fixed this line is
    % commented out.
%     space = 7*n - 2;

    
    while (conflicts > 0)
        while (steps < max_steps)
            
            attackedColumns = find(attackedQueens > 0);
            numCalls = numCalls + n;
            
            for i = attackedColumns
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
                        numCalls = numCalls + n;
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
        
        numCalls = numCalls + 4*n;
    end

end