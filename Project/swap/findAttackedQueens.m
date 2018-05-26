function attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: if a queen is not alone in diagonal then it is
    %              an attacked queen
    %
    % Parameters :
    %           
    %              solution is the vector that describes the current state
    %
    %              negDiagQueens is all the diagonals with opposite slope
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same slope
    %              with the main diagonal
    %
    %                          
    %
    % Return     : return a vector that shows which queens are attacked
    
    n = length(solution);
    attackedQueens = zeros(1,n);
    %Queen is attacked if her diagonals have more than 1 queen
    for i=1:n
        if (negDiagQueens(i-solution(i)+n) > 1) || (posDiagQueens(i+solution(i)-1) > 1)
            attackedQueens(i) = 1;
        end
    end
end