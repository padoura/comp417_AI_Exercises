function newColumn = mrv(currDomain, solution)
    unassigned = solution == 0;
    sumCurrDomain = sum(currDomain(:,unassigned), 1);
    [~, argmin] = min(sumCurrDomain);
    tempColumns = find(unassigned == 1, argmin);
    newColumn = tempColumns(end);
end