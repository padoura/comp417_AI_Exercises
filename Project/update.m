function currDomain = updateDomain(currDomain, row, column, unassignedColumn)
    for i_row = 1:size(currDomain,1)
        currDomain(i_row, unassignedColumn) = isConflicted(row, column, i_row, unassignedColumn);
    end
end