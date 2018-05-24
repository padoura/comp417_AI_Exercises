clear all
close all
clc

load('results_all.mat');

M = N;

N = N(N>99);
L = M(M>99);

% figure(1)
% plot(N, results.min_conflict_time_avg, '-k', N(N<upper_limit_fc_mrv), results.fc_mrv_time_avg, '-r', N, results.swap_time_avg, '-b')
% set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')

%%

ftitle = 'Execution Time - Problem Size (Log Scale)';
Fontsize = 12;

h1 = figure(1)
plot(M, results.min_conflict_time_avg, '-k',...
    M(M<upper_limit_fc_mrv), results.fc_mrv_time_avg, '-r',...
    M, results.swap_time_avg, '-b')
xlim([4 10000])
title(ftitle,'FontSize',Fontsize)
legend('min conflicts','FC+MRV','swap','Location','Best')
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
plot(M, results.min_conflict_calls_avg, '-k',...
    M(M<upper_limit_fc_mrv), results.fc_mrv_calls_avg, '-r',...
    M, results.swap_calls_avg, '-b',...
    M(M<upper_limit_fc_mrv), 5*2.^M(M<upper_limit_fc_mrv),'--',...
    N, 105*N.*log2(N),'--',N, 7*N.^2,'--',N, 700*N,'--',N, 12000*log2(N),'--')
xlim([4 10000])
title(ftitle,'FontSize',Fontsize)
legend('min conflicts','FC+MRV','swap','O(2^n)','O(nlogn)','O(n^2)','O(n)','O(logn)','Location','Best')
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
plot(M, results.min_conflict_space_avg, '-k',...
    M(M<upper_limit_fc_mrv), results.fc_mrv_space_avg, '-r', M, results.swap_space_avg, '-b',...
    M(M<upper_limit_fc_mrv), 6*2.^M(M<upper_limit_fc_mrv),'--')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
xlim([4 10000])
title(ftitle,'FontSize',Fontsize)
legend('min conflicts - O(n)','FC+MRV','swap - O(n)','O(2^n)','Location','Best')
legend boxoff
ylabel('Arbitrary Memory Unit')
xlabel('Number of Queens')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')

saveas(h3,'space_complexity.fig')

%%

routexport

