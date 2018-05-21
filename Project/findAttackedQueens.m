function attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens)
    n = length(solution);
    attackedQueens = zeros(1,n);
    %Queen is attacked if her diagonals have more than 1 queen
    for i=1:n
        if (negDiagQueens(i-solution(i)+n) > 1) || (posDiagQueens(i+solution(i)-1) > 1)
            attackedQueens(i) = 1;
        end
    end
end