function newColumn = mrv(currDomain, solution)
    unassigned = solution == 0;
    sumCurrDomain = sum(currDomain(:,unassigned), 1);
    [minrv,~] = min(sumCurrDomain);
    cand=find(sumCurrDomain==minrv);%find the mrv unassigned queens
    randchoose = randi(length(cand));
    tmpcolumns=find(unassigned == 1,cand(randchoose));
    newColumn=tmpcolumns(end);
end