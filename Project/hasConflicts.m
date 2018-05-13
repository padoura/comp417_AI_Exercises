function hasCon = hasConflicts(solution, column)
    hasCon = 0;
    n = size(solution, 2);
    indices = 1:n;
    indices = indices(indices~=column); %removes the same queen to prevent checking conflicts with itself
    for j = indices
        if isConflicted(solution(column), column, solution(j), j)
            hasCon = 1;
            return
        end
    end
end