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
    % example:newsolution=[10 12 3] means that first queen has placed at tenth row,       
    % second queen has placed at eleventh row and third queen at third row.
    % newsolution=[],means empty matrix and the algorithm hasn't find any
    % solution.
	
    % Parameters :
    %               n=#of queens
    % 
    % Return     :
    %               [the appropriate position for each queen to avoid conflicts,
    %                #of calls until it find a solution or not,space complexity]
    % 
    %               
    solution = zeros(1,n);%we haven't assigned any position yet
    currDomain = ones(n);%rows for all queens,one when a row hasn't any conflicts and zeros has.
    column = randi(n); %choose a random column to start
    numCalls = 0;
    
    space = n^2 + 2*n;
    
    for row = 1:n
        solution(column) = row;%placed the first random choose queen at row one.
        [newSolution, newCalls, newSpace] = fc_mrv(currDomain, solution, row, column);
        space = space + newSpace;
        numCalls = numCalls + newCalls;
        if newSolution
            return
        end
    end
end