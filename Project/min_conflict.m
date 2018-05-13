function solution = min_conflict(n, max_steps)
    solution = randi(n,1,n);
    steps = 0;
    while(hasTotalConflicts(solution) && steps < max_steps)
        column = randi(n);
        if (hasConflicts(solution, column))
            countConflicts = zeros(1,n);
            for row = 1:n
                countConflicts(row) = sumOfConflicts(solution, row, column);
            end
            argmin = datasample(find(countConflicts == min(countConflicts)), 1);
            solution(column) = argmin;
        end
        steps = steps + 1;
    end
end
                