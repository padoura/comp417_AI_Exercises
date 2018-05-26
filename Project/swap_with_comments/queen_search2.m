function [solution, numCalls]  = queen_search2(n)

    %  File    :   run_n_queens
    % 
    %      Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: init all the queens to random positions,at the beginning
    % each column and each row has only one queen.We calculate how many
    % queens each diagonal(positive and negative)has,after that we
    % calculate the direct conflicts between the queens and found the queens that
    % been attacked.Next step is to choose an attacked queen to swap
    % with and another chosen random queen.In essence we make again and
    % again permutations  and accept those permutations that has less
    % conflicts than the current state,with this manner we don't need to
    % check for row conflicts.We repeat the above process
    % until we haven't any conflict or exceeds the max_steps and in that
    % case we start again the search from different initial state.
    %
    %
    % Parameters :
    %               n is # of queens
    % 
    % Return     :
    %               [the row for each queen,# of calls for time complexity]
    %               solution is a vector in example solution=[3 4 5] means  
    %               that the first queen is at position(row) three,the second 
    %               queen is at the position four and the third queen is at    
    %               the positions five

    %For time cost estimation we assume that each call of checkDiagonals(),
    %countDiagConflicts(), findAttackedQueens(), find(), min(), zeros(),
    %ones(), randperm() cost n units.
    
    %For space cost estimation we count each vector which size depends on
    %n.

    
    %Constants from Sosic and Gu (1991).
    C1 = 0.45;
    max_steps = 32*n;
    
    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution);%put queen to diagonals
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
    limit = C1 * conflicts;
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
    steps = 0;
    
    numCalls = 4*n; % keeps the time cost
    
    % keeps the space cost of each array; since it's fixed this line is
    % commented out.
%     space = 7*n - 2;

    
    while (conflicts > 0)
        while (steps < max_steps)
            
            attackedColumns = find(attackedQueens > 0);
            numCalls = numCalls + n;
            
            for i = attackedColumns
                steps = steps + 1;
                j = randi(n);
                while (j==i)%choose random the queen that swap with attacked queen positions
                    j = randi(n);
                end
                if swapIsBetter(i, j, negDiagQueens, posDiagQueens, solution)
                    [solution, negDiagQueens, posDiagQueens, conflicts] =...
                        performSwap(solution, i, j, negDiagQueens, posDiagQueens, conflicts);
                    
                    if (conflicts == 0)%success
                        return
                    elseif (conflicts < limit)
                        limit = C1 * conflicts;
                        attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
                        numCalls = numCalls + n;
                        break
                    end
                end
            end
        end
        
        % Reinitialize while loop
        solution = randperm(n);
        [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
        conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
        limit = C1 * conflicts;
        attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
        steps = 0;
        
        numCalls = numCalls + 4*n;
    end

end