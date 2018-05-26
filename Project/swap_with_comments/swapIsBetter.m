function boolean = swapIsBetter(i, j, negDiagQueens, posDiagQueens, solution)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: check if swap positions in i and j queens have less  
    %              conflicts
    % Parameters :
    %              i is an attacked queen
    %              
    %              j is a random queen
    %              
    %              negDiagQueens is all the diagonals with opposite tendency
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same tendency
    %              with the main diagonal
    %
    %              solution is the vector that decribes the current state            
    %
    % Return     :return one if this state has less conflicts than the
    %             current else zero


    n = length(solution);
    conflictDiff = 0;
    
    %Check how conflicts change in two current negative diagonals
    diagonal = i-solution(i)+n;%i queen
    if negDiagQueens(diagonal) > 1
        conflictDiff = conflictDiff - 1;
    end
    diagonal = j-solution(j)+n;%j queen
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