# OpenIE-Algorithm
 OpenIE中的算法
# 刀具磨损预测神经网络
##  传统刀具磨损量测定存在的问题
数控加工中心的刀具磨损情况，对于加工件的质量（如：表面粗糙度与尺寸公差）有很大影响，如果能对机床的车刀磨损量有一个相对准确的测定，同时根据磨损量与质量间的关系确定更换机床刀具的时间，将能极大提升机加工产品的质量。<br><br>
在工业界，对于刀具磨损量测定主要有以下两个方法：（1）高级工程师的经验与传统机械公式判断：该方法中经验公式的系数由大量数据总结而成，但是针对不同刀具公式变化频繁，且有经验的工程师培养周期很长；（2）基于图像识别的刀具磨损量检测：该方法利用卷积神经网络输入海量标注磨损度的刀具数据，对这些数据进行训练，但是其需要人力去标注数据，且图像识别精度有限，测定值与实际磨损存在较大偏差。<br><br>
同时，以上2种刀具磨损量预测方法都存在一个对于实际生产影响巨大的问题：需要停机并且人工清理好切屑才能进行检验，绝大多数机加工企业的流水线生产对于流水线连续性要求很高，停机检查会让整个生产周期拉长。<br><br>
## 基于BPNN的刀具磨损量测定模型
我们试图寻找一种可以在机床工作时也可以测定刀具磨损度的预测方法，我们先对高维信号进行特征工程处理，在此基础上，将所获得的特征值与一维数据结合，运用Back-Propagation Neural Network反向传播神经网络模型对刀具磨损量进行预测。<br><br>

在操作过程中，我们采用传感器技术，利用声音传感器、振动传感器、电流传感器对不同操作条件下的铣床运行进行观察与记录，得到了在常规切削、进口切削以及出口切削时的刀具磨损相关数据，并将这些数据实时写入Matlab的mill.mat文件中（见图2.3）。<br><br>
https://github.com/QianZeHao123/OpenIE-Algorithm/tree/main/nc_machining_center/DATA<br><br>

在实验操作过程中，铣床上刀具切削的操作条件是从工业适用性角度出发，以制造商推荐的设置为指导，具体如下（见表2.1）

为了便于建立模型，我们对相关变量进行了说明，具体如下表所示（见表2.2）。<br><br>

### 数据处理
由于我们训练刀具磨损量测定神经网络模型使用的是个人PC，配置如下：CPU（Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz），GPU（NVIDIA GeForce GTX 1660），内存8.0 GB。一些几万参数的中大型神经网络模型无法在这种低算力的个人设备上进行训练，因此本项目中一组9000个数据的车床电流、震动和噪声信号无法被直接当做参数输入神经网络，故我们决定使用特征工程的方法，对6组采集的信号进行时域、频域分析，大大减少输入数据的量，并对分析后的数据进行筛选，选取对模型较为敏感的特征。<br><br>
我们团队使用Matlab编写绘制了所有输出信号的脚本，用于人工筛选可以用来被训练的数据。在mill.mat文件中，共收集有167组数据，其中有21组数据中缺少刀具磨损量VB，因此不能被列入训练集，同时还有一组数据通过图像发现AC/DC电压出现 $ 10^{29} $ 异常，可能是由于信号传感器出现问题。经过人工观察图像筛选训练用信号，共有145组可被用于训练集。
https://github.com/QianZeHao123/OpenIE-Algorithm/blob/main/nc_machining_center/draw_pic.m<br><br>

### 特征筛选
## BPNN反向传递神经网络模型
## 结果展示与分析
