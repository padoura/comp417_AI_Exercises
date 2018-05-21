function [negDiagQueens, posDiagQueens] = checkDiagonals(solution)
    n = length(solution);
    negDiagQueens = zeros(1,2*n+1);
    posDiagQueens = zeros(1,2*n+1);
    %Count queens in all diagonals; each queen is in 1 positive and 1
    %negative diagonal.
    for i=1:n
       negDiagQueens(i-solution(i)+n)= negDiagQueens(i-solution(i)+n)+1;
       posDiagQueens(i+solution(i)-1)= posDiagQueens(i+solution(i)-1)+1;
    end
end