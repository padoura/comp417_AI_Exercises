function numConflicts = sumOfConflicts(solution, row, column)
    numConflicts = 0;
    n = size(solution, 2);
    solution(column) = row; %changes solution locally
    indices = 1:n;
    indices = indices(indices~=column); %removes the same queen to prevent checking conflicts with itself
    for j = indices
        if isConflicted(solution(column), column, solution(j), j)
            numConflicts = numConflicts + 1;
        end
    end
end