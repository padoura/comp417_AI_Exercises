function [solution, numCalls] = min_conflict(n)
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
    % be attacked.Next step is to choose random an attacked queen to move
    % and then for each candidate position of her to calculate the
    % conflicts that we avoid and the conflicts that be create and with
    % this criteria(of gain) to choose random between the new candidate
    % positions which have the same good(all the best than all the rest) 
    % reduces of conflicts than this state.We repeat the above process
    % until we haven't any conflict or exceeds the max_steps and in that
    % case we start again the search from different state.
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
    
    
    %Constant for max steps from Sosic and Gu (1991), although it is rarely
    %(if ever) reached with this algorithm.
    max_steps = 32*n; 
    
    
    %For time cost measurement we assume that each call of checkDiagonals(),
    %countDiagConflicts(), findAttackedQueens(), find(), min(), zeros(),
    %ones(), randperm() cost n units.
    
    %For space cost estimation we count each vector which size depends on
    %n.

    % Initialize while loop
    solution = randperm(n);
    [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
    rowQueens = ones(1,n); %each queen starts in a different row,each row has one queen
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);%counts diagonal only the direct conflicts
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);%attacked by same row,same diagonal
    steps = 0;
    
    numCalls = 5*n; % keeps the time cost
    
    % keeps the space cost of each array; since it's fixed this line is
    % commented out.
%     space = 10*n - 2;

    while(conflicts > 0)
        while (steps < max_steps)
            steps = steps + 1;
            attackedColumns = find(attackedQueens > 0);
            numCalls = numCalls + n;
            column = attackedColumns(randperm(length(attackedColumns),1));%choose random a queen that is been attacked
            
            conflictsPerRow = zeros(1,n);
            numCalls = numCalls + n;
            
            for row = 1:n %save the difference of conflicts from the current state that we will have if we choose this row
                conflictsPerRow(row) = countConflictsPerRow(column, row,...
                    negDiagQueens, posDiagQueens, rowQueens, solution);
            end
            
            argmin = datasample(find(conflictsPerRow == min(conflictsPerRow)), 1);%choose random between next rows that provoke less conflicts.
            numCalls = numCalls + 2*n;
            
            [solution, negDiagQueens, posDiagQueens, rowQueens, conflicts] =...
                updateState(solution, column, argmin, negDiagQueens, posDiagQueens, rowQueens, conflicts);
            if (conflicts == 0)
                return
            else
                attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
                numCalls = numCalls + n;
            end
        end
        
        % Reinitialize while loop to ensure completeness
        solution = randperm(n);
        [negDiagQueens, posDiagQueens] = checkDiagonals(solution);
        rowQueens = ones(1,n);
        conflicts = countDiagConflicts(negDiagQueens, posDiagQueens);
        attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens);
        steps = 0;
        
        numCalls = numCalls + 5*n;
    end
end
                