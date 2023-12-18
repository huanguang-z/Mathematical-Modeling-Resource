% 读取Excel数据
filename = 'SixKindsAll.xlsx'; % 请将这里替换为您的Excel文件路径
data_range = 'A2:G1086';
[num, txt, raw] = xlsread(filename, data_range);

% 获取销售量数据
sales_data = cell2mat(raw(:, 2:end));

% 类别名
categories = {'花叶类', '花菜类', '水生根茎类', '茄类','辣椒类' '食用菌'};

% 进行自定义的KS检验
% results = cell(1, 6);
% alpha = 0.05;  % 显著性水平
% for i = 1:6
%     data = sales_data(:, i);
%     n = length(data);
%     lambda = mean(data); % 泊松分布的参数
% 
%     % 计算经验CDF
%     [f_empirical, x_empirical] = ecdf(data);
%     
%     % 计算泊松的理论CDF
%     f_theoretical = poisscdf(x_empirical, lambda);
%     
%     % 计算最大差值
%     ks_statistic = max(abs(f_empirical - f_theoretical));
%     
%     % 计算KS统计量的临界值
%     critical_value = sqrt(-0.5*log(alpha/2)/n);
% 
%     if ks_statistic <= critical_value
%         results{i} = [categories{i} ': 满足泊松分布，KS统计量为 ' num2str(ks_statistic)];
%     else
%         results{i} = [categories{i} ': 不满足泊松分布，KS统计量为 ' num2str(ks_statistic)];
%     end
% end

% 进行KS检验
results = cell(6, 1);
for i = 1:6
    data = sales_data(:, i);
    results{i} = [categories{i} ': '];
    
    % 正态分布
    [h, p] = kstest((data - mean(data)) / std(data)); % Z-score normalization
    if h == 0
        results{i} = [results{i} '满足正态分布 (p=' num2str(p) '), '];
    else
        results{i} = [results{i} '不满足正态分布 (p=' num2str(p) '), '];
    end
    
    % 对数正态分布
    [h, p] = kstest(log(data - min(data) + 1)); % Shift to make data positive
    if h == 0
        results{i} = [results{i} '满足对数正态分布 (p=' num2str(p) '), '];
    else
        results{i} = [results{i} '不满足对数正态分布 (p=' num2str(p) '), '];
    end
    
    % 伽马分布
    % Estimate parameters
    phat = gamfit(data);
    [h, p] = kstest(data, 'CDF', @(x)gamcdf(x, phat(1), phat(2)));
    if h == 0
        results{i} = [results{i} '满足伽马分布 (p=' num2str(p) ').'];
    else
        results{i} = [results{i} '不满足伽马分布 (p=' num2str(p) ').'];
    end
end

results
