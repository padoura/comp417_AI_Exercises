function conflicted =  isConflicted(row, column, unassignedRow, unassignedColumn)
    conflicted = 0;
    if (row == unassignedRow || abs(row - unassignedRow)==abs(column - unassignedColumn))
       conflicted = 1;
    end
end
    