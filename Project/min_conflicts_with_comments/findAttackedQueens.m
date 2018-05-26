function attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens)
    %  File    :   run_n_queens
    % 
    %      Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: if a queen is not alone in diagonal or in a row then is
    %              be an attacked queen
    %
    % Parameters :
    %           
    %              solution is the vector that decribes the current state
    %
    %              negDiagQueens is all the diagonals with opposite tendency
    %              than main diagonal
    %
    %              posDiagQueens is all the diagonals with the same tendency
    %              with the main diagonal
    %
    %              rowQueens is the vector that show the #of queens to each row               
    %
    % Return     :return all the queens that be attacked
                
                 
    
    
    
    n = length(solution);
    attackedQueens = zeros(1,n);
    %Queen is attacked if her diagonals or row have more than 1 queen
    for i=1:n%i-th queen
        if (negDiagQueens(i-solution(i)+n) > 1) || (posDiagQueens(i+solution(i)-1) > 1) || (rowQueens(solution(i)) > 1)
            attackedQueens(i) = 1;
        end
    end
end