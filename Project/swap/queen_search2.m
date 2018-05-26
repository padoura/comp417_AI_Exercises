function [solution, numCalls]  = queen_search2(n)

    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: Initialize all the queens to random positions. At the beginning
    % each column and each row has only one queen. We calculate how many
    % queens each diagonal (positive and negative) has, Subsequently, we
    % calculate the direct conflicts between the queens and find the attacked queens.
    % Next step is to choose an attacked queen to swap
    % with an another randomly chosen queen. In essence the solution always remains a
    % permutation, and the algorithm accepts the permutation that has less
    % conflicts than the current state. In this manner we don't need to
    % check for row conflicts. We repeat the above process
    % until we don't have any conflicts. If the maximum number of steps is exceeded,
    % the solution is reinitialized.
    %
    %
    % Parameters :
    %               n is # of queens
    % 
    % Return     :
    %               [the row for each queen,# of calls for time complexity]

    %For time cost estimation we assume that each call of checkDiagonals(),
    %countDiagConflicts(), findAttackedQueens(), find(), randperm() cost n units.
    
    %For space cost estimation we count each vector which size depends on
    %n.

    
    %Constants from Sosic and Gu (1991).
    C1 = 0.45;
    max_steps = 32*n;
    
    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution); % put queen to diagonals
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
    limit = C1 * conflicts;
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens);
    steps = 0;
    
    numCalls = 4*n; % keeps the time cost
    
    % keeps the space cost of each array; since it's fixed this line is
    % commented out.
%     space = 7*n;

    
    while (conflicts > 0)
        while (steps < max_steps)
            
            attackedColumns = find(attackedQueens > 0);
            numCalls = numCalls + n;
            
            for i = attackedColumns
                steps = steps + 1;
                j = randi(n);
                while (j==i) % randomly choose a second queen for swap
                    j = randi(n);
                end
				
				numCalls = numCalls + 1; %for each iteration below
				
                if swapIsBetter(i, j, negDiagQueens, posDiagQueens, solution)
                    [solution, negDiagQueens, posDiagQueens, conflicts] =...
                        performSwap(solution, i, j, negDiagQueens, posDiagQueens, conflicts);
                    
                    if (conflicts == 0) % success
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