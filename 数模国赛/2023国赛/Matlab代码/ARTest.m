% 数据点
x = [-0.39, -0.39, -0.37, -0.22, -0.22, 0.02, 0.56, 0.71, 0.83, 0.83, 0.83, 0.90];
y = [0.7550306339149915, -0.7550306339149915, 0, 0.008720476301879622, -0.008720476301879622, 0, 0, 0, 0.00760747410688726, -0.00760747410688726, 0, 0];

% 创建一个新的图形窗口
figure;

% 绘制单位圆
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'b-', 'LineWidth', 1.5); % 使用蓝色线条绘制单位圆
hold on;

% 描绘数据点
scatter(x, y, 50, 'm', 'filled'); % 使用洋红色填充的圆点表示数据点

% 调整坐标轴
axis equal; 
axis([-2 2 -2 2]); % 设置坐标轴范围
xlabel('实部');
ylabel('虚部');
title('AR根检验');
grid on;

% 绘制坐标轴
line([-2, 2], [0, 0], 'Color', 'k', 'LineWidth', 1.5); % x轴
line([0, 0], [-2, 2], 'Color', 'k', 'LineWidth', 1.5); % y轴

hold off;