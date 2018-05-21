function attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens)
    n = length(solution);
    attackedQueens = zeros(1,n);
    %Queen is attacked if her diagonals or row have more than 1 queen
    for i=1:n
        if (negDiagQueens(i-solution(i)+n) > 1) || (posDiagQueens(i+solution(i)-1) > 1) || (rowQueens(solution(i)) > 1)
            attackedQueens(i) = 1;
        end
    end
end