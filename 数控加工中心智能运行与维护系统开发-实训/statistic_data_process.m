clear;clc;
load('./DATA/data.mat');

for n = 1:145
    data(n).smcAC_max = max(data(n).smcAC);
    data(n).smcDC_max = max(data(n).smcDC);
    data(n).smcAC_min = min(data(n).smcAC);
    data(n).smcDC_min = min(data(n).smcDC);
end

save data;
