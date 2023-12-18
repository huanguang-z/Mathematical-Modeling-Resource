clc,clear;
data=xlsread("高钾.xlsx");
SD=zscore(data);
relevantmatrix=corrcoef(SD);
d=pdist(SD','correlation');
R_link=linkage(d,'average');
img=dendrogram(R_link);
set(img,'Color','k','LineWidth',1.3);
division=cluster(R_link,'maxclust',10);
for i=1:10
    obj=find(division==i);
    obj=reshape(obj,1,length(obj));
    fprintf('第% d类的有% s\n',i,int2str(obj));
end