% 提供六个Excel表的路径
filepaths = {
    'huaye.xlsx',
    'huacai.xlsx',
    'shuishenggenjing.xlsx',
    'qielei.xlsx',
    'lajiao.xlsx',
    'shiyongjun.xlsx'
};

% 品类和对应的蔬菜名称
categories = {
    '花叶类', '花菜类', '水生根茎类', '茄类', '辣椒类', '食用菌'
};
vegetables = {
    {'云南生菜', '云南油麦菜', '上海青'},
    {'西蓝花', '青梗散花', '枝江青梗散花'},
    {'净藕（1）', '洪湖莲藕(粉藕)', '高瓜(1)'},
    {'紫茄子(2)', '青茄子(1)', '长线茄'},
    {'芜湖青椒(1)', '泡泡椒(精品)', '螺丝椒'},
    {'西峡香菇(1)', '金针菇(盒)', '西峡花菇(1)'}
};

% 颜色配置
colors = [
    0.8500    0.3250    0.0980;  % 橙色
    0.9290    0.6940    0.1250;  % 黄色
    0.4940    0.1840    0.5560   % 紫色
];

% 绘制折线图
% 绘制折线图
% 绘制折线图
figure;
for i = 1:6
    % 读取数据
    [num, txt, ~] = xlsread(filepaths{i});
    
    % 检查数据列数
    numCols = size(num, 2) - 1; % 减1是因为A列是日期
    values = num(2:end, 2:(1+numCols));
    
    % 截取相同长度的dates
    dates = datetime(txt(2:(1+size(values, 1)), 1), 'InputFormat', 'yyyy-MM-dd'); % 假设日期格式为dd-MM-yyyy
    
    % 子图
    subplot(2, 3, i);
    hold on;
    for j = 1:numCols
        plot(dates, values(:, j), 'Color', colors(j, :), 'DisplayName', vegetables{i}{j});
    end
    hold off;
    legend('Location', 'best');
    title(categories{i});
    xlabel('Date');
    ylabel('Value');
end
