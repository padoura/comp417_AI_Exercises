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
N = [20:10:100 200:100:1000 2000:1000:10000];
num_trials = 20;

min_conflict_time = zeros(length(N),num_trials);
fc_mrv_time = zeros(length(N/3),num_trials);
swap_time = zeros(length(N),num_trials);

for i = 1:length(N)
    for j = 1:num_trials
        fprintf('Problem size: %i\t Trial: %i\n', N(i), j)
        
        if (N(i) < 200)
            cd fc_mrv
            fc_mrv_t_start = cputime;
            fc_mrv_solution = fc_mrv_main(N(i));
            fc_mrv_t_end = cputime;
            cd ..
        end

        cd min_conflicts
        min_conflict_t_start = cputime;
        min_conflict_solution = min_conflict(N(i));
        min_conflict_t_end = cputime;
        cd ..
        
        cd swap
        swap_t_start = cputime;
        swap_solution = queen_search2(N(i));
        swap_t_end = cputime;
        cd ..

        min_conflict_time(i,j) = min_conflict_t_end - min_conflict_t_start;
        fc_mrv_time(i,j) = fc_mrv_t_end - fc_mrv_t_start;
        swap_time(i,j) = swap_t_end - swap_t_start;
    end
end

min_conflict_time_avg = mean(min_conflict_time, 2);
fc_mrv_time_avg = mean(fc_mrv_time, 2);
swap_time_avg = mean(swap_time, 2);

plot(N, min_conflict_time_avg, '-k', N/3, fc_mrv_time_avg, '-r', N, swap_time_avg, '-b')