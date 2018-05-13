clear all
close all
clc

n = 1e+4;
max_steps = 2;

% fc_mrv_t_start = cputime;
% fc_mrv_solution = fc_mrv_main(n);
% fc_mrv_t_end = cputime;

min_conflict_t_start = cputime;
min_conflict_solution = min_conflict(n, max_steps);
min_conflict_t_end = cputime;
hasTotalConflicts(min_conflict_solution)

min_conflict_time = min_conflict_t_end - min_conflict_t_start;
% fc_mrv_time = fc_mrv_t_end - fc_mrv_t_start;

min_conflict_time

fc_mrv_time