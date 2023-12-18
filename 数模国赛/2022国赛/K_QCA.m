clc,clear;
data=xlsread("高钾改.xlsx");
SD=zscore(data);
euclideanmetric=pdist(SD);
Q_link=linkage(euclideanmetric,'average');
img=dendrogram(Q_link);
set(img,'Color','k','LineWidth',1.3);
for i=2:4
    fprintf('分为% d个亚类的结果是：\n',i);
    num=cluster(Q_link,'maxclust',i);
    for j=1:i
        obj=find(num==j);
        obj=reshape(obj,1,length(obj));
        fprintf('第% d亚类的有% s\n',j,int2str(obj));
    end
    if i==4
        break
    end
    fprintf('******************************************************\n')
end