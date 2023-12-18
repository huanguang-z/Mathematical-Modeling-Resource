% 读取数据
filename = 'Curvefit.xlsx'; % 请替换为您的Excel文件路径
data = xlsread(filename, 'A2:L31');

% 初始化存储空间
splineModels = cell(1, 6); % 用于存储6个样条模型
expressions = cell(1, 6); % 用于存储样条模型的表达式

% 为每一对列进行拟合
for i = 1:6
    y = data(:, i);
    x = data(:, i + 6);
    
    % 检查x中是否存在重复的值，并处理
    [uniqueX, ~, idx] = unique(x);
    uniqueY = accumarray(idx, y, [], @mean);
    
    % 使用三次样条拟合
    splineModels{i} = spline(uniqueX, uniqueY);
    
    % 获取样条模型的系数和节点，并构建表达式
    coefs = splineModels{i}.coefs;
    knots = splineModels{i}.breaks;
    expression = 'y = ';
    
    for j = 1:length(knots) - 1
        seg_expr = sprintf('%.2fx^3 + %.2fx^2 + %.2fx + %.2f for %.2f <= x < %.2f, ', coefs(j, 1), coefs(j, 2), coefs(j, 3), coefs(j, 4), knots(j), knots(j + 1));
        expression = [expression seg_expr];
    end
    
    expression = expression(1:end-2); % 去掉最后的逗号和空格
    expressions{i} = expression;
end

% 打印每个样条模型的表达式
for i = 1:6
    fprintf('Function for pair %d:\n%s\n\n', i, expressions{i});
end
