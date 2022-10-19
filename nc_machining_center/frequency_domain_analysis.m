% frequency_domain_analysis 时域信号分析
%%
clear;clc;
load('./DATA/data.mat');

%%
% 删掉6个信号
data = rmfield(data, {'smcAC', 'AE_spindle', 'smcDC', 'vib_table', 'vib_spindle', 'AE_table'});
% 保存数据
save frequency_domain_analysis;
