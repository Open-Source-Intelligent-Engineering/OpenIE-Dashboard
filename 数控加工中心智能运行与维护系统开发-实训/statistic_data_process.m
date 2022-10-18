%%
clear;clc;
load('./DATA/data.mat');

%%
for n = 1:145
    % smcAC, smcDC, vib_table, vib_spindle, AE_table, AE_spindle
    % 时域特征 绝对均值， 峰值， 均方根值， 方根辐值， 歪度值， 峭度值， 波形因子， 脉冲因子， 偏度因子， 峰值因子， 裕度因子
    %% smcAC
    data(n).smcAC_ma = mean(abs(data(n).smcAC)); % 绝对均值
    data(n).smcAC_peak = max(abs(data(n).smcAC)); % 峰值
    data(n).smcAC_rms = rms(data(n).smcAC); % 均方根值
    data(n).smcAC_ra = mean(sqrt(abs(data(n).smcAC))).^2; % 方根幅值
    % data(n).smcAC_skewness =  % 歪度值，这个太难做了，要自己定义一个函数
    data(n).smcAC_kurtosis = mean(data(n).smcAC.^4); % 峭度值
    data(n).smcAC_shape = data(n).smcAC_rms ./ data(n).smcAC_ma; % 波形因子
    data(n).smcAC_pulse = data(n).smcAC_rms ./ data(n).smcAC_ma; % 脉冲因子
    % data(n).smcAC_fshape = data(n).smcAC_skewness ./ (data(n).smcAC_rms).^3; % 偏度因子
    data(n).smcAC_crest = data(n).smcAC_peak ./ data(n).smcAC_rms; % 峰值因子
    data(n).smcAC_clearance  = data(n).smcAC_peak ./ data(n).smcAC_ra; % 裕度因子
    
    %% smcDC
    data(n).smcDC_ma = mean(abs(data(n).smcDC)); % 绝对均值
    data(n).smcDC_peak = max(abs(data(n).smcDC)); % 峰值
    data(n).smcDC_rms = rms(data(n).smcDC); % 均方根值
    data(n).smcDC_ra = mean(sqrt(abs(data(n).smcDC))).^2; % 方根幅值
    % data(n).smcDC_skewness =  % 歪度值，这个太难做了，要自己定义一个函数
    data(n).smcDC_kurtosis = mean(data(n).smcDC.^4); % 峭度值
    data(n).smcDC_shape = data(n).smcDC_rms ./ data(n).smcDC_ma; % 波形因子
    data(n).smcDC_pulse = data(n).smcDC_rms ./ data(n).smcDC_ma; % 脉冲因子
    % data(n).smcDC_fshape = data(n).smcDC_skewness ./ (data(n).smcDC_rms).^3; % 偏度因子
    data(n).smcDC_crest = data(n).smcDC_peak ./ data(n).smcDC_rms; % 峰值因子
    data(n).smcDC_clearance  = data(n).smcDC_peak ./ data(n).smcDC_ra; % 裕度因子
    
    %% vib_table
    data(n).vib_table_ma = mean(abs(data(n).vib_table)); % 绝对均值
    data(n).vib_table_peak = max(abs(data(n).vib_table)); % 峰值
    data(n).vib_table_rms = rms(data(n).vib_table); % 均方根值
    data(n).vib_table_ra = mean(sqrt(abs(data(n).vib_table))).^2; % 方根幅值
    % data(n).vib_table_skewness =  % 歪度值，这个太难做了，要自己定义一个函数
    data(n).vib_table_kurtosis = mean(data(n).vib_table.^4); % 峭度值
    data(n).vib_table_shape = data(n).vib_table_rms ./ data(n).vib_table_ma; % 波形因子
    data(n).vib_table_pulse = data(n).vib_table_rms ./ data(n).vib_table_ma; % 脉冲因子
    % data(n).vib_table_fshape = data(n).vib_table_skewness ./ (data(n).vib_table_rms).^3; % 偏度因子
    data(n).vib_table_crest = data(n).vib_table_peak ./ data(n).vib_table_rms; % 峰值因子
    data(n).vib_table_clearance  = data(n).vib_table_peak ./ data(n).vib_table_ra; % 裕度因子
    
    %% vib_spindle
    data(n).vib_spindle_ma = mean(abs(data(n).vib_spindle)); % 绝对均值
    data(n).vib_spindle_peak = max(abs(data(n).vib_spindle)); % 峰值
    data(n).vib_spindle_rms = rms(data(n).vib_spindle); % 均方根值
    data(n).vib_spindle_ra = mean(sqrt(abs(data(n).vib_spindle))).^2; % 方根幅值
    % data(n).vib_spindle_skewness =  % 歪度值，这个太难做了，要自己定义一个函数
    data(n).vib_spindle_kurtosis = mean(data(n).vib_spindle.^4); % 峭度值
    data(n).vib_spindle_shape = data(n).vib_spindle_rms ./ data(n).vib_spindle_ma; % 波形因子
    data(n).vib_spindle_pulse = data(n).vib_spindle_rms ./ data(n).vib_spindle_ma; % 脉冲因子
    % data(n).vib_spindle_fshape = data(n).vib_spindle_skewness ./ (data(n).vib_spindle_rms).^3; % 偏度因子
    data(n).vib_spindle_crest = data(n).vib_spindle_peak ./ data(n).vib_spindle_rms; % 峰值因子
    data(n).vib_spindle_clearance  = data(n).vib_spindle_peak ./ data(n).vib_spindle_ra; % 裕度因子
    
    %% AE_table
    data(n).AE_table_ma = mean(abs(data(n).AE_table)); % 绝对均值
    data(n).AE_table_peak = max(abs(data(n).AE_table)); % 峰值
    data(n).AE_table_rms = rms(data(n).AE_table); % 均方根值
    data(n).AE_table_ra = mean(sqrt(abs(data(n).AE_table))).^2; % 方根幅值
    % data(n).AE_table_skewness =  % 歪度值，这个太难做了，要自己定义一个函数
    data(n).AE_table_kurtosis = mean(data(n).AE_table.^4); % 峭度值
    data(n).AE_table_shape = data(n).AE_table_rms ./ data(n).AE_table_ma; % 波形因子
    data(n).AE_table_pulse = data(n).AE_table_rms ./ data(n).AE_table_ma; % 脉冲因子
    % data(n).AE_table_fshape = data(n).AE_table_skewness ./ (data(n).AE_table_rms).^3; % 偏度因子
    data(n).AE_table_crest = data(n).AE_table_peak ./ data(n).AE_table_rms; % 峰值因子
    data(n).AE_table_clearance  = data(n).AE_table_peak ./ data(n).AE_table_ra; % 裕度因子
    
    %% AE_spindle
    data(n).AE_spindle_ma = mean(abs(data(n).AE_spindle)); % 绝对均值
    data(n).AE_spindle_peak = max(abs(data(n).AE_spindle)); % 峰值
    data(n).AE_spindle_rms = rms(data(n).AE_spindle); % 均方根值
    data(n).AE_spindle_ra = mean(sqrt(abs(data(n).AE_spindle))).^2; % 方根幅值
    % data(n).AE_spindle_skewness =  % 歪度值，这个太难做了，要自己定义一个函数
    data(n).AE_spindle_kurtosis = mean(data(n).AE_spindle.^4); % 峭度值
    data(n).AE_spindle_shape = data(n).AE_spindle_rms ./ data(n).AE_spindle_ma; % 波形因子
    data(n).AE_spindle_pulse = data(n).AE_spindle_rms ./ data(n).AE_spindle_ma; % 脉冲因子
    % data(n).AE_spindle_fshape = data(n).AE_spindle_skewness ./ (data(n).AE_spindle_rms).^3; % 偏度因子
    data(n).AE_spindle_crest = data(n).AE_spindle_peak ./ data(n).AE_spindle_rms; % 峰值因子
    data(n).AE_spindle_clearance  = data(n).AE_spindle_peak ./ data(n).AE_spindle_ra; % 裕度因子
    
end

save data;
