function [solution, numCalls] = min_conflict(n)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: initialize all the queens to random positions. At the beginning
    % each column and each row has only one queen. We calculate how many
    % queens each diagonal (positive and negative) has. Subsequently we
    % calculate the direct conflicts between the queens and find the queens that
    % are attacked. Next  an attacked queen is chosen randomly
    % and then for each row the net gain or loss of conflicts is calculated.
    % The row with minimum conflicts is selected. We repeat the above process
    % until we don't have any conflicts. If the maximum number of steps is exceeded,
    % the solution is reinitialized.
    %
    % Parameters :
    %               n is # of queens
    % 
    % Return     :
    %               [the row for each queen, # of calls for time complexity estimation]
    
    
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
    rowQueens = ones(1,n); %each queen starts in a different row (each row has one queen)
    conflicts = countDiagConflicts(negDiagQueens, posDiagQueens); % only the direct conflicts
    attackedQueens = findAttackedQueens(solution, negDiagQueens, posDiagQueens, rowQueens); % attacked by same row or same diagonal
    steps = 0;
    
    numCalls = 5*n; % keeps the time cost
    
    % keeps the space cost of each array; since it's fixed this line is
    % commented out.
%     space = 9*n;

    while(conflicts > 0)
        while (steps < max_steps)
            steps = steps + 1;
            attackedColumns = find(attackedQueens > 0);
            numCalls = numCalls + n;
            column = attackedColumns(randperm(length(attackedColumns),1));% randomly choose an attacked queen
            
            conflictsPerRow = zeros(1,n);
            numCalls = numCalls + n;
            
            for row = 1:n % save the difference of conflicts from the current state that we will have if we choose this row
                conflictsPerRow(row) = countConflictsPerRow(column, row,...
                    negDiagQueens, posDiagQueens, rowQueens, solution);
            end
            
            argmin = datasample(find(conflictsPerRow == min(conflictsPerRow)), 1); % choose randomly if more than one minimum exists
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
                