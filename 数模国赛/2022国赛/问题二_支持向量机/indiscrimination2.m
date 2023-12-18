clc,clear;
none=xlsread("无差别处理45铅钡16高钾6待处理.xlsx");
none_T=none';  
alknown=none_T(:,[1:61]);  %提取已知数据
unknown=none_T(:,[62:end]);  %提取未知数据
[a,ps]=mapstd(alknown);  %对已分类数据进行标准化处理
meanvector=ps.xmean;  %存储已分类数据的均值向量
SDvector=ps.xstd;  %存储已分类数据的标准差向量
b=mapstd('apply',unknown,ps);  %对未分类数据进行标准化处理
group=[ones(45,1);-ones(16,1)];  %对已知数据进行类别标号
train=fitcsvm(a',group);  %训练支持向量机分类器
sv_index=find(train.IsSupportVector);  %返回支持向量的标签
f_weights=train.Alpha;  %分类函数的权系数
f_cons=train.Bias;  %分类函数的常数项
check=predict(train,a');  %用已分类的数据带入检验
err_rate=1-sum(group==check)/length(group);  %计算错判率
judgment=predict(train,b');  %判断未分类数据类别