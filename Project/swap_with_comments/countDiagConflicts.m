function conflicts = countDiagConflicts(negDiagQueens, posDiagQueens)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: if a diagonal has more than one queen then we have in
    % this diagonal #queens minus one of direct conflicts,if it has only
    % one queen the it has zero conflicts.Finally sum all the conflicts
    % from all the diagonals
    %
    % Parameters :
    %           
    %              negDiagQueens is all the diagonals with opposite tendency
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same tendency
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