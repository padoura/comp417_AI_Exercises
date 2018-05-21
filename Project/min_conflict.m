function solution = min_conflict(n)
    max_steps = 32*n;

    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
    steps = 0;
    


    while(conflicts > 0)
        while (steps < max_steps)
            attackedColumns = find(attackedQueens > 0);
            column = attackedColumns(randperm(length(attackedColumns),1));
            conflictsPerRow = zeros(1,n);
            for row = 1:n
                
            







%     solution = randi(n,1,n);
%     steps = 0;
%     hasConflictsBool = hasTotalConflicts(solution);
%     while(hasConflictsBool && steps < max_steps)
%         column = randi(n);
%         if (hasConflicts(solution, column))
%             countConflicts = zeros(1,n);
%             for row = 1:n
%                 countConflicts(row) = sumOfConflicts(solution, row, column);
%             end
%             argmin = datasample(find(countConflicts == min(countConflicts)), 1);
%             solution(column) = argmin;
%             hasConflictsBool = hasTotalConflicts(solution);
%         end
%         steps = steps + 1;
%     end
end
                