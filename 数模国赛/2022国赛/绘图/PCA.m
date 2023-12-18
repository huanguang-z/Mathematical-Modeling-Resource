% clc;clear;
% JustMatrixAForThePCA=xlsread('PCAForYi.xlsx','A1:H32');
% JustMatrixAForThePCA=zscore(JustMatrixAForThePCA);
% MatrixForGaoK=xlsread('PCAForYi.xlsx','A1:H6');
% MatrixForGaoK=zscore(MatrixForGaoK);
% MatrixForPbBa=xlsread("PCAForYi.xlsx",'A7:H32');
% MatrixForPbBa=zscore(MatrixForPbBa);
% CenterForPCA=mean(JustMatrixAForThePCA);
% [coeff, ~, latent, ~, ~] = pca(JustMatrixAForThePCA);
% % r1 r2 为自定义的向量大小参数(模)
% PCArR1 = 6;
% rR2PCA = 3;
% % p1 p2 为第一主轴和第二主轴上的点
% p1 = PCArR1*coeff(:, 1)'+CenterForPCA;
% p2 = rR2PCA*coeff(:, 2)'+CenterForPCA;
% % 主轴方向与X轴之间的夹角
% Oursjdaangle = cart2pol(coeff(1, :), coeff(2, :))*180/pi;
% betjsalidlka = Oursjdaangle(1, 1);
% % 置信椭圆坐标（以 95% 为例）
% PCdalAOursemimajor = sqrt(latent(1, 1)); % 长轴长度（一半）
% OursemiminorPCA = sqrt(latent(2, 1)); % 短轴长度（一半）
% alpha = linspace(0, 360, 2000)';
% % level = 4.605;  % 90%
% level = 5.991;% 95%
% %level = 9.210;% 99%
% % 椭圆坐标点
% PCAellipse_X = CenterForPCA(1, 1)+sqrt(level)*(PCdalAOursemimajor*cosd(alpha)*cosd(betjsalidlka)-...
% OursemiminorPCA*sind(alpha)*sind(betjsalidlka));
% PCAellipse_Y = CenterForPCA(1, 2)+sqrt(level)*(PCdalAOursemimajor*cosd(alpha)*sind(betjsalidlka)+...
% OursemiminorPCA*sind(alpha)*cosd(betjsalidlka));
% 
% figure
% hold on
% % 原始数据
% scatter(MatrixForGaoK(:, 1), MatrixForGaoK(:, 2), 25, 'LineWidth', 0.5,...
%         'Marker', '*',...
%         'MarkerEdgeColor', [0, 114, 189]/255,...
%         'MarkerFaceColor', [0, 114, 189]/255);
% scatter(MatrixForPbBa(:, 1), MatrixForPbBa(:, 2), 11, 'LineWidth', 0.5,...
%         'Marker', 'o',...
%         'MarkerEdgeColor', [162, 20, 46]/255,...
%         'MarkerFaceColor', [162, 20, 46]/255);
% xlim([-10.5, 10.5]);
% ylim([-10.5, 10.5]);
% set(gca, 'linewidth', 1)
% 
% % 置信椭圆
% plot(PCAellipse_X, PCAellipse_Y, 'Color', [0, 102, 255]/255,...
%     'LineStyle', '-', 'LineWidth', 2),
% 
% % 第一主轴方向
% % arrow_1 = annotation('arrow', 'Color', [162, 20, 47]/255,...
% %     'HeadStyle', 'cback2', 'LineWidth', 3, 'HeadWidth', 20, 'HeadLength', 20);
% % arrow_1.Parent = gca;
% % arrow_1.X = [CenterForPCA(1, 1), p1(1, 1)];
% % arrow_1.Y = [CenterForPCA(1, 2), p1(1, 2)];  
% % 
% % % 第二主轴方向
% % arrow_2 = annotation('arrow', 'Color', [0, 114, 189]/255,...
% %     'HeadStyle', 'cback2', 'LineWidth', 3, 'HeadWidth', 20, 'HeadLength', 20);
% % arrow_2.Parent = gca;
% % arrow_2.X = [CenterForPCA(1, 1), p2(1, 1)];
% % arrow_2.Y = [CenterForPCA(1, 2), p2(1, 2)];  
% 
% % 中心点
% plot(CenterForPCA(1, 1), CenterForPCA(1, 2),...
%     'Marker', '*',...
%     'MarkerSize', 4,...
%     'MarkerEdgeColor', [162, 20, 46]/255,...
%     'MarkerFaceColor', [162, 20, 46]/255);
% 
%  text(2, -3, '95% 置信椭圆', 'FontSize', 10, 'FontWeight', 'normal')
%  xlabel('F1');
%  ylabel('F2');
%  legend('风化高钾玻璃','风化铅钡玻璃');
% axis equal