function [negDiagQueens, posDiagQueens] = checkDiagonals(solution)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: Calculate how many queens has each diagonal 
    %
    % Parameters :
    %              solution is the vector that describes the current state
    %
    % Return     :
    %             [negative diagonal are all the diagonals which have opposite
    %              slope than the main diagonal,positive diagonal are all
    %              the diagonals which have the same slope with the main
    %              diagonal]
    %             


    n = length(solution);
    negDiagQueens = zeros(1,2*n-1);
    posDiagQueens = zeros(1,2*n-1);
    %Count queens in all diagonals; each queen is in 1 positive and 1
    %negative diagonal.
    for i=1:n %i-th queen, solution(i) is her row
       negDiagQueens(i-solution(i)+n)= negDiagQueens(i-solution(i)+n)+1;
       posDiagQueens(i+solution(i)-1)= posDiagQueens(i+solution(i)-1)+1;
    end
end