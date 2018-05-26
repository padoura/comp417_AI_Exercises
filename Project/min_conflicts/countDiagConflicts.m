function conflicts = countDiagConflicts(negDiagQueens, posDiagQueens)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: if a diagonal has at least one queen then
    % this diagonal has (#queens - 1) direct conflicts.
    % It returns the sum all the conflicts from all the diagonals.
    %
    % Parameters :
    %           
    %              negDiagQueens is all the diagonals with opposite slope
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same slope
    %              with the main diagonal
    %
    %                          
    %
    % Return     :
    %              ONLY diagonal direct conflicts
    
    negDiagQueens = negDiagQueens(negDiagQueens > 0); 
    posDiagQueens = posDiagQueens(posDiagQueens > 0); 
    conflicts = sum(negDiagQueens-1) + sum(posDiagQueens-1);
end