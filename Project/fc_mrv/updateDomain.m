function currDomain = updateDomain(currDomain, row, column, unassignedColumn)
    for unassignedRow = 1:size(currDomain,1)
        if (isConflicted(row, column, unassignedRow, unassignedColumn))
            currDomain(unassignedRow, unassignedColumn) = 0;
        end
    end
end                                 