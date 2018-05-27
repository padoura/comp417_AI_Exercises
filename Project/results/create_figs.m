%  Authors :   Pantourakis Michail, Proestakis Ioannis
%  Date    :   Spring 2018
% 
%  Course  :   Artificial Intelligence (COMP 417) - Technical University
%  of Crete
%   
%  Description: Run this file to generate figures.

clear all
close all
clc

load('results_final2.mat');

M = N;
L = 150:1:60000;
nlongfun = 0.00004*L.*log2(L);
nsquaredfun = 0.0000019*L.^2;
nlinearfun = 0.0003*L;

index = find(mod(N,10)==0);

%%

ftitle = 'Execution Time - Problem Size (Log Scale)';
Fontsize = 12;

h1 = figure(1)
set(h1, 'Position', [10,10,1000,1000]);

plot(M(index), results.min_conflict_time_avg(index), '-k',...
    M(index), results.fc_mrv_time_avg(index), '-r',...
    M(index), results.swap_time_avg(index), '-b',...
    M(M<100), 0.002*1.1.^M(M<100),'--',...
    L, nlongfun,'--',...
    L, nsquaredfun,'--',...
    L, nlinearfun, '--')
xlim([10 60001])
title(ftitle,'FontSize',Fontsize)
legend('min conflicts','FC-MRV','QS2','O(2^n)','O(nlogn)','O(n^2)','O(n)','Location','Best')
legend boxoff
ylabel('Execution Time [s]')
xlabel('Number of Queens')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')

saveas(h1,'execution_time.fig')

%%

ftitle = 'Time Complexity (Log Scale)';
Fontsize = 12;

h2 = figure(2)
set(h2, 'Position', [10,10,1000,1000]);

plot(M(index), results.min_conflict_calls_avg(index), '-k',...
    M(index), results.fc_mrv_calls_avg(index), '-r',...
    M(index), results.swap_calls_avg(index), '-b',...
    M(M<100), 550*1.15.^M(M<100),'--',...
    N(M>99), 105*N(M>99).*log2(N(M>99)),'--',N(M>99), 7*N(M>99).^2,'--',N(M>99), 700*N(M>99),'--')
xlim([10 60001])
title(ftitle,'FontSize',Fontsize)
legend('min conflicts','FC-MRV','QS2','O(2^n)','O(nlogn)','O(n^2)','O(n)','O(logn)','Location','Best')
legend boxoff
ylabel('Number of Operations')
xlabel('Number of Queens')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')

saveas(h2,'time_complexity.fig')

%%

ftitle = 'Space Complexity (Log Scale)';
Fontsize = 12;

h3 = figure(3)
set(h3, 'Position', [10,10,1000,1000]);

plot(M, results.min_conflict_space_avg, '-k',...
    M, results.fc_mrv_space_avg, '-r', M, results.swap_space_avg, '-b',...
    M(M<100), 600*1.18.^M(M<100),'--')
xlim([10 101])
title(ftitle,'FontSize',Fontsize)
legend('min conflicts - O(n)','FC-MRV','QS2 - O(n)','O(2^n)','Location','Best')
legend boxoff
ylabel('Arbitrary Memory Unit')
xlabel('Number of Queens')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')

saveas(h3,'space_complexity.fig')

%%

routexport

