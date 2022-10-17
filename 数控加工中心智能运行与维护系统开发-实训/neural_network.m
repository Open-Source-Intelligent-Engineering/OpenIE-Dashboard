%%
clc;close;clear;

%%
load('./DATA/mill.mat');
n = 1;
smcAC = mill(n).smcAC;
smcDC = mill(n).smcDC;
vib_table = mill(n).vib_table;
vib_spindle = mill(n).vib_spindle;
AE_table = mill(n).AE_table;
AE_spindle = mill(n).AE_spindle;

% data_Y=data_all(:,3);
% data_NDVI=data_all(:,4);
% data_Soil=data_all(:,5);
% Y=table2array(data_Y);
% N=table2array(data_NDVI);
% S=table2array(data_Soil);
% X=[N S];

%%