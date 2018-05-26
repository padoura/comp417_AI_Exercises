function conflicted =  isConflicted(row, column, unassignedRow, unassignedColumn)
	%  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: Checks for row and diagonal attacks
    % 
    % Parameters :
    %              row is the position of assigned queen 
    %              
    %              column is our assigned queen
    %
    %              unassignedRow a position that we will check for conflicts 
    %
    %              unassignedColumn a candidate, not yet placed, queen
    % 
    % Return     :
    %               returns 1 if queens collide, 0 otherwise
    
    conflicted = 0; 
    if (row == unassignedRow || abs(row - unassignedRow)==abs(column - unassignedColumn))
       conflicted = 1;
    end
end
    