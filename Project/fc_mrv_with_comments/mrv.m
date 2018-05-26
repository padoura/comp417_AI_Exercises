function newColumn = mrv(currDomain, solution)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description:we search for all unassigned queens(queens that hasn't be placed)
    % yet and we choose random the queen that has the minimum remaining
    % # of rows(positions)
    % Parameters :
    %              currDomain is a matrix with all available rows(positions 
    %              with not any conflicts) for all queens
    %                 
    %              solution is the vector that shows where we had put each queen,            
    %              if vector solution has zeros values means that the corresponding
    %              queen hasn't assigned(not be placed) yet
    % 
    % Return     :
    %               newColumn is the next queen that will be placed(assigned)
    
    unassigned = solution == 0;%all the unassigned queens
    sumCurrDomain = sum(currDomain(:,unassigned), 1);%calculate the available positions
    [minrv,~] = min(sumCurrDomain);%find the minimun # of positions
    cand=find(sumCurrDomain==minrv);%find the queens which they have minimum # of positions
    randchoose = randi(length(cand));%choose random 
    tmpcolumns=find(unassigned == 1,cand(randchoose));%unassigned queens with mrv feature and unassigned with no this feature.
    newColumn=tmpcolumns(end);%the last one is the wanted
end