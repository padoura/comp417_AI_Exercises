clear all
close all
clc

%  File    :   run_n_queens
% 
%  Authors :   Pantourakis Michail, Proestakis Ioannis
%  Date    :   Spring 2018
% 
%  Course  :   Artificial Intelligence (COMP 417) - Technical University
%  of Crete
%   
% Description: The running script for solving n-queens with Min-Conflicts
% and FC-MRV (see AIMA textbook for more details), saving their
% performance.
% 
% Parameters :
%               N is the vector for problems of different size
% 
%               max_steps is the maximum number of steps Min-Conflicts is
%               allowed to run
% 
%               num_trials is the number of times the problem is solved per
%               method
% 
% Return     :
%               [min_conflict_time_avg fc_mrv_time_avg] the average
%               running times of the respective algorithms per problem size
% 
%               [min_conflict_memory_avg fc_mrv_memory_avg] the average
%               maximum memory used by the respective algorithms per
%               problem size

rng(87,'twister')
N = [4:1:20 30:10:100 200:100:1000 2000:1000:10000];
num_trials = 100;
upper_limit_fc_mrv = 21;

min_conflict_time = zeros(length(N),num_trials);
min_conflict_calls = zeros(length(N),num_trials);
min_conflict_space = zeros(length(N),num_trials);

fc_mrv_time = zeros(length(N(N<upper_limit_fc_mrv)),num_trials);
fc_mrv_calls = zeros(length(N(N<upper_limit_fc_mrv)),num_trials);
fc_mrv_space = zeros(length(N(N<upper_limit_fc_mrv)),num_trials);

swap_time = zeros(length(N),num_trials);
swap_calls = zeros(length(N),num_trials);
swap_space = zeros(length(N),num_trials);

if any(N < 4)
    fprintf('N-Queens problem cannot be solved for N < 4.\nPlease change value of N. \n')
    return
end


for i = 1:length(N)
    for j = 1:num_trials
        clc;
        fprintf('Problem size: %i\t Trial: %i\n', N(i), j)
        
        if (N(i) < upper_limit_fc_mrv)
            cd fc_mrv
            fc_mrv_t_start = cputime;
            [fc_mrv_solution, fc_mrv_calls(i,j), fc_mrv_space(i,j)] = fc_mrv_main(N(i));
            fc_mrv_t_end = cputime;
            cd ..
            
            fc_mrv_time(i,j) = fc_mrv_t_end - fc_mrv_t_start;
        end

        cd min_conflicts
        min_conflict_t_start = cputime;
        [min_conflict_solution, min_conflict_calls(i,j)] = min_conflict(N(i));
        min_conflict_t_end = cputime;
        
        min_conflict_time(i,j) = min_conflict_t_end - min_conflict_t_start;
        min_conflict_space(i,j) = 10*N(i) - 2;
        
        cd ..
        
        cd swap
        swap_t_start = cputime;
        [swap_solution, swap_calls(i,j)] = queen_search2(N(i));
        swap_t_end = cputime;
        
        swap_time(i,j) = swap_t_end - swap_t_start;
        swap_space(i,j) = 7*N(i) - 2;
        cd ..
    end
end

results.min_conflict_time_avg = mean(min_conflict_time, 2);
results.min_conflict_calls_avg = mean(min_conflict_calls, 2);
results.min_conflict_space_avg = mean(min_conflict_space, 2);

results.fc_mrv_time_avg = mean(fc_mrv_time, 2);
results.fc_mrv_calls_avg = mean(fc_mrv_calls, 2);
results.fc_mrv_space_avg = mean(fc_mrv_space, 2);


results.swap_time_avg = mean(swap_time, 2);
results.swap_calls_avg = mean(swap_calls, 2);
results.swap_space_avg = mean(swap_space, 2);

cd results
save('results.mat','results')
cd ..

%%
figure(1)
plot(N, results.min_conflict_time_avg, '-k', N(N<upper_limit_fc_mrv), results.fc_mrv_time_avg, '-r', N, results.swap_time_avg, '-b')
set(gca, 'YScale', 'log')

figure(2)
plot(N, results.min_conflict_calls_avg, '-k', N(N<upper_limit_fc_mrv), results.fc_mrv_calls_avg, '-r', N, results.swap_calls_avg, '-b')
set(gca, 'YScale', 'log')

figure(3)
plot(N, results.min_conflict_space_avg, '-k', N(N<upper_limit_fc_mrv), results.fc_mrv_space_avg, '-r', N, results.swap_space_avg, '-b')
set(gca, 'YScale', 'log')