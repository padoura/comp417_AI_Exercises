function [newSolution, numCalls, space] = fc_mrv_main(n)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description:CSP,solution with forward checking and MRV heuristic 
    % example:newsolution=[1 2 3] means that first queen has placed at first row,       
    % second queen has placed at second row and third queen at third row.
    % newsolution=[],means empty matrix and the algorithm hasn't find any
    % solution.
	
    % Parameters :
    %               n=#of queens
    % 
    % Return     :
    %               [the valid row for each queen to avoid conflicts,
    %                #of calls until it find a solution or not,space complexity]
    % 
    %               
    solution = zeros(1,n); % we haven't assigned any position yet
    currDomain = ones(n); % 1 when positions are valid, 0 when are not valid
    column = randi(n); % choose a random column to start
    numCalls = n^2 + n;
    
    space = n^2 + n;
    
    for row = 1:n
        solution(column) = row;
        [newSolution, newCalls, newSpace] = fc_mrv(currDomain, solution, row, column);
        space = space + newSpace;
        numCalls = numCalls + newCalls;
        if newSolution
            return
        end
    end
end