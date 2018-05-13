function hasCon = hasTotalConflicts(solution)
    hasCon = 0;
    n = size(solution, 2);
    for i = 1:n-1
        for j = i+1:n
            if isConflicted(solution(i), i, solution(j), j)
                hasCon = 1;
                return
            end
        end
    end
end