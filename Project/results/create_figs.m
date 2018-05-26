clear all
close all
clc

load('results.mat');

M = N;

index = find(mod(N,10)==0);

% N = N(N>99);
% L = M(M>99);

% figure(1)
% plot(N, results.min_conflict_time_avg, '-k', N(N<upper_limit_fc_mrv), results.fc_mrv_time_avg, '-r', N, results.swap_time_avg, '-b')
% set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')

%%

ftitle = 'Execution Time - Problem Size (Log Scale)';
Fontsize = 12;

h1 = figure(1)
plot(M(index), results.min_conflict_time_avg(index), '-k',...
    M(index), results.fc_mrv_time_avg(index), '-r',...
    M(index), results.swap_time_avg(index), '-b')
xlim([10 60000])
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
plot(M(index), results.min_conflict_calls_avg(index), '-k',...
    M(index), results.fc_mrv_calls_avg(index), '-r',...
    M(index), results.swap_calls_avg(index), '-b',...
    M(M<100), 550*1.15.^M(M<100),'--',...
    N(M>99), 105*N(M>99).*log2(N(M>99)),'--',N(M>99), 7*N(M>99).^2,'--',N(M>99), 700*N(M>99),'--',N(M>99), 12000*log2(N(M>99)),'--')
xlim([10 60000])
title(ftitle,'FontSize',Fontsize)
legend('min conflicts','FC+MRV','swap','O(2^n)','O(nlogn)','O(n^2)','O(n)','O(logn)','Location','Best')
legend boxoff
ylabel('Number of Operations')
xlabel('Number of Queens')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')

saveas(h2,'time_complexity.fig')

%%

% ftitle = 'Space Complexity (Log Scale)';
% Fontsize = 12;
% 
% h3 = figure(3)
% plot(M, results.min_conflict_space_avg, '-k',...
%     M(M<upper_limit_fc_mrv), results.fc_mrv_space_avg, '-r', M, results.swap_space_avg, '-b',...
%     M(M<upper_limit_fc_mrv), 6*2.^M(M<upper_limit_fc_mrv),'--')
% set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')
% xlim([4 10000])
% title(ftitle,'FontSize',Fontsize)
% legend('min conflicts - O(n)','FC+MRV','swap - O(n)','O(2^n)','Location','Best')
% legend boxoff
% ylabel('Arbitrary Memory Unit')
% xlabel('Number of Queens')
% set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')
% 
% saveas(h3,'space_complexity.fig')

%%

routexport

