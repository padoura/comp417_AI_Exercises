function conflicted =  isConflicted(row, column, unassignedRow, unassignedColumn)
	%  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description:we check if a position for an unassigned queen has
    % conflicts
    % Parameters :
    %              row is the position of assigned queen 
    %              
    %              column is our assigned queen
    %
    %              unassignedRow a position that we will check for conflicts 
    %
    %              unassignedColumn a candidate not be placed yet queen
    % 
    % Return     :
    %               conflicted is a flag with values zeros(we haven't conflict)
    %               and one(we have conflict)
    
    conflicted = 0;%check for row and diagonal attacks
    if (row == unassignedRow || abs(row - unassignedRow)==abs(column - unassignedColumn))
       conflicted = 1;
    end
end
    