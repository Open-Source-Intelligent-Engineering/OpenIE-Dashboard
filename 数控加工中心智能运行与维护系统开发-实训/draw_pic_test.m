
%%
clc;clear;

%%
load('./DATA/mill.mat');
for n = 1:167
%%
    smcAC = mill(n).smcAC;
    smcDC = mill(n).smcDC;
    vib_table = mill(n).vib_table;
    vib_spindle = mill(n).vib_spindle;
    AE_table = mill(n).AE_table;
    AE_spindle = mill(n).AE_spindle;
    title("机床信号");
    subplot(2,3,1), plot(smcAC), xlabel('交流主轴电机电流信号');
    subplot(2,3,2), plot(smcDC), xlabel('直流主轴电机电流信号');
    subplot(2,3,3), plot(vib_table), xlabel('工作台振动信号');
    subplot(2,3,4), plot(vib_spindle), xlabel('主轴振动信号');
    subplot(2,3,5), plot(AE_table), xlabel('工作台噪音信号');
    subplot(2,3,6), plot(AE_spindle), xlabel('主轴噪音信号');

    %%
    number = num2str(n); % 数字转换为字符串
    filename = ['picture', number]; % 字符串拼接
    saveas(gcf,['./PIC/',filename,'.fig']);

    %%
    close all;
end