% 读取Excel数据
filename = 'SixKindsAll.xlsx'; % 请将这里替换为您的Excel文件路径
data_range = 'A2:G1086';
[num, txt, raw] = xlsread(filename, data_range);

% 获取日期和数据
dates = datetime(txt(:,1), 'InputFormat', 'yyyy-MM-dd'); % 这里假设您的日期格式为dd-MM-yyyy，如有需要，请更改为适当的格式
values = cell2mat(raw(:, 2:end));

% % 绘制折线图
% figure;
% hold on;
% colors = [
%     0.8500    0.3250    0.0980;  % 橙色
%     0.9290    0.6940    0.1250;  % 黄色
%     0.4940    0.1840    0.5560;  % 紫色
%     0.4660    0.6740    0.1880;  % 绿色
%     0.3010    0.7450    0.9330;  % 蓝色
%     0.6350    0.0780    0.1840   % 红色
% ];
% 
% categories = {'花叶类', '花菜类', '水生根茎类', '茄类','辣椒类' '食用菌'};
% for i = 1:6
%     plot(dates, values(:, i), 'Color', colors(i, :), 'DisplayName', categories{i});
% end
% 
% legend('Location', 'best');
% xlabel('日期');
% ylabel('销售量（千克）');
% hold off;
% 绘制子图
figure;
for i = 1:6
    subplot(2, 3, i); % 3行2列的子图布局
    plot(dates, values(:, i), 'Color', colors(i, :), 'DisplayName', categories{i});
    legend('Location', 'best');
    xlabel('日期');
    ylabel('销售量（千克）');
    title(categories{i});
end
