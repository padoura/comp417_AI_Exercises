function boolean = swapIsBetter(i, j, negDiagQueens, posDiagQueens, solution)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: checks if swapping i and j queens descreases the # of
    %              conflicts
    % Parameters :
    %              i is an attacked queen
    %              
    %              j is a random queen
    %              
    %              negDiagQueens is all the diagonals with opposite slope
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same slope
    %              with the main diagonal
    %
    %              solution is the vector that describes the current state            
    %
    % Return     : return one if this state has less conflicts than the
    %              current, zero otherwise


    n = length(solution);
    conflictDiff = 0;
    
    %Check how conflicts change in two current negative diagonals
    diagonal = i-solution(i)+n; % for i queen
    if negDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    diagonal = j-solution(j)+n; % for j queen
    if negDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end

    %Check how conflicts change in two current positive diagonals
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    
    %swap
    solution([i j]) = solution([j i]);
    
    %Check how conflicts change in two current negative diagonals
    diagonal = i-solution(i)+n;
    if negDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    diagonal = j-solution(j)+n;
    if negDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end

    %Check how conflicts change in two current positive diagonals
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 0
        conflictDiff = conflictDiff + 1;
    end
    
    boolean = conflictDiff < 0;
end