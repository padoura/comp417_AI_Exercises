function newColumn = mrv(currDomain, solution)
    %  File    :   run_n_queens
    % 
    %  Authors :   Pantourakis Michail, Proestakis Ioannis
    %  Date    :   Spring 2018
    % 
    %  Course  :   Artificial Intelligence (COMP 417) - Technical University
    %  of Crete
    %   
    % Description: Finds the unassigned with the minimum remaining valid rows 
    % Parameters :
    %              currDomain is a matrix showing all the valid rows for all queens
    %                 
    %              solution is the vector that shows where we have put each queen,            
    %              if vector solution has zeros values means that the corresponding
    %              queen hasn't assigned(not be placed) yet
    % 
    % Return     :
    %               newColumn is the next MRV queen that will be assigned
    
    unassigned = solution == 0;
    sumCurrDomain = sum(currDomain(:,unassigned), 1);%calculate the available positions
    [minrv,~] = min(sumCurrDomain);
    cand=find(sumCurrDomain==minrv); %find the mrv unassigned queens
    randchoose = randi(length(cand));
    tmpcolumns=find(unassigned == 1,cand(randchoose));
    newColumn=tmpcolumns(end); % the last one is the wanted
end