function [solution, negDiagQueens, posDiagQueens, conflicts] = ...
    performSwap(solution, i, j, negDiagQueens, posDiagQueens, conflicts)
    
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: Swaps positions between i and j queens. The negative and positive
    %			   diagonals change, and the difference between the old and new
	%    		   direct conflicts is calculated. Conflicts are also updated.
    %        
    % Parameters :
    %              
    %              solution is the vector that describes the current state
    %
    %              i is an attacked queen
    %              
    %              j is a random queen
    %              
    %              negDiagQueens is all the diagonals with opposite slope
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same slope
    %              with the main diagonal
    %              conflicts is the number of directs conflicts for current
    %              state
    %
    %                          
    %
    % Return     : solution, diagonal arrays and conflicts



    n = length(solution);
    
    %Update two current negative diagonals if there are conflicts
    diagonal = i-solution(i)+n;
    if negDiagQueens(diagonal) > 1
        negDiagQueens(diagonal) = negDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        negDiagQueens(diagonal) = 0;
    end
    diagonal = j-solution(j)+n;
    if negDiagQueens(diagonal) > 1
        negDiagQueens(diagonal) = negDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        negDiagQueens(diagonal) = 0;
    end

    %Update two current positive diagonals if there are conflicts
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 1
        posDiagQueens(diagonal) = posDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        posDiagQueens(diagonal) = 0;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 1
        posDiagQueens(diagonal) = posDiagQueens(diagonal) - 1;
        conflicts = conflicts - 1;
    else %queen was alone in that diagonal
        posDiagQueens(diagonal) = 0;
    end
    
    %swap
    solution([i j]) = solution([j i]);
    
    %Update two new negative diagonals if there are conflicts
    diagonal = i-solution(i)+n;
    if negDiagQueens(diagonal) > 0
        negDiagQueens(diagonal) = negDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        negDiagQueens(diagonal) = 1;
    end
    diagonal = j-solution(j)+n;
    if negDiagQueens(diagonal) > 0
        negDiagQueens(diagonal) = negDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        negDiagQueens(diagonal) = 1;
    end

    %Update two new positive diagonals if there are conflicts
    diagonal = i+solution(i)-1;
    if posDiagQueens(diagonal) > 0
        posDiagQueens(diagonal) = posDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        posDiagQueens(diagonal) = 1;
    end
    diagonal = j+solution(j)-1;
    if posDiagQueens(diagonal) > 0
        posDiagQueens(diagonal) = posDiagQueens(diagonal) + 1;
        conflicts = conflicts + 1;
    else %queen is alone in that diagonal
        posDiagQueens(diagonal) = 1;
    end

end