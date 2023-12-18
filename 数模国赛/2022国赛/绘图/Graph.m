% %基于数据绘制8个饼状图
% %图一左四张
% % clc,clear;
% % VariableX=[0.375,0,0.625];
% % Label={'A','B','C'};
% % t = tiledlayout(2,2);
% % tiledlayout(2,2,'TileSpacing','compact','Padding','tight');
% % %hTitle = title('铅钡玻璃的风化情况');
% % AXax=nexttile(1);
% % pie3(VariableX);
% % hLegend = legend(Label, 'Position', [0.85 0.3 0.2 0.1]);
% % hLegend.ItemTokenSize = [5 5];
% % %legend('A','B','C');
% % legend('boxoff');
% % title('风化的铅钡玻璃纹饰比例图');
% % set(gcf,'Color',[1 1 1]);
% % colormap("winter");
% % %subplot(2,2,2);
% % AXax=nexttile(2);
% % VariableX1=[0.4167,0,0.5833];
% % legend('boxoff');
% % pie3(VariableX1);
% % title('未风化的铅钡玻璃纹饰比例图');
% % th = findobj(gca, 'Type', 'text');
% % %subplot(2,2,3)
% % AXax=nexttile(3);
% % VariableX2=[0,1,0];
% % legend('boxoff');
% % pie3(VariableX2);
% % title('风化的高钾玻璃纹饰比例图');
% % th = findobj(gca, 'Type', 'text');
% % %subplot(2,2,4);
% % AXax=nexttile(4);
% % VariableX3=[0.6,0,0.4];
% % legend('boxoff');
% % pie3(VariableX3);
% % title('未风化的高钾玻璃纹饰比例图');
% %print('GraphOurFirst.jpg','-r1800','-dpng')
% 
% % %图一右四张
% % clc,clear;
% % ColorVariable1=[0.042,0,0.167,0.125,0.5,0,0.083,0.083];
% % Label={'浅绿','绿','深绿','蓝绿','浅蓝','深蓝','紫','黑'};
% % t = tiledlayout(2,2);
% % tiledlayout(2,2,'TileSpacing','loose','Padding','loose');
% % AXax=nexttile(1);
% % pie3(ColorVariable1);
% % hLegend = legend(Label, 'Position', [0.85 0.3 0.2 0.1]);
% % hLegend.ItemTokenSize = [5 5];
% % legend('浅绿','绿','深绿','蓝绿','浅蓝','深蓝','紫','黑');
% % legend('boxoff');
% % title('风化的铅钡玻璃颜色比例图');
% % set(gcf,'Color',[1 1 1]);
% % colormap('parula');
% % AXax=nexttile(2);
% % ColorVariable2=[0.167,0.083,0.167,0,0.333,0.083,0.167,0];
% % pie3(ColorVariable2);
% % title('未风化的铅钡玻璃颜色比例图');
% % AXax=nexttile(3);
% % ColorVariable3=[0,0,0,1,0,0,0,0];
% % pie3(ColorVariable3);
% % title('风化的高钾玻璃颜色比例图');
% % AXax=nexttile(4);
% % ColorVariable4=[0,0,0.1,0.6,0.2,0.1,0,0];
% % pie3(ColorVariable4);
% % title('未风化的高钾玻璃颜色比例图');
% % % print('GraphOurSecond.jpg','-r1800','-dpng')
% % 
% %未风化
% clc,clear;
% MatrixAForPCAWei=xlsread("PCAForWei.xlsx",'A1:J35');
% MatrixAForPCAWei=zscore(MatrixAForPCAWei);
% MatrixForWeiGaoK=xlsread('PCAForWei.xlsx','A1:J12');
% MatrixForWeiGaoK=zscore(MatrixForWeiGaoK);
% MatrixForWeiPbBa=xlsread('PCAForWei.xlsx','A13:J35');
% MatrixForWeiPbBa=zscore(MatrixForWeiPbBa);
% CenterForPCAWei=mean(MatrixAForPCAWei);
% [coeff, ~, latent, ~, ~] = pca(MatrixAForPCAWei);
% % % r1 r2 为自定义的向量大小参数(模)
% r1 = 6;
% r2 = 3;
% % p1 p2 为第一主轴和第二主轴上的点
% p1 = r1*coeff(:, 1)'+CenterForPCAWei;
% p2 = r2*coeff(:, 2)'+CenterForPCAWei;
% % 主轴方向与X轴之间的夹角
% angle = cart2pol(coeff(1, :), coeff(2, :))*180/pi;
% beta = angle(1, 1);
% % 置信椭圆坐标（以 95% 为例）
% semimajor = sqrt(latent(1, 1)); % 长轴长度（一半）
% semiminor = sqrt(latent(2, 1)); % 短轴长度（一半）
% alpha = linspace(0, 360, 2000);
% % % level = 4.605;  % 90%
%  level = 5.991;% 95%
% %  %level = 9.210;% 99%
% % % 椭圆坐标点
% ellipse_XWei = CenterForPCAWei(1, 1)+sqrt(level)*(semimajor*cosd(alpha)*cosd(beta)-...
% semiminor*sind(alpha)*sind(beta));
% ellipse_YWei = CenterForPCAWei(1, 2)+sqrt(level)*(semimajor*cosd(alpha)*sind(beta)+...
% semiminor*sind(alpha)*cosd(beta));
% 
% figure
% hold on
% scatter(MatrixForWeiGaoK(:, 1),MatrixForWeiGaoK(:, 2), 14, 'LineWidth', 0.5,...
%         'Marker', 'p',...
%         'MarkerEdgeColor', [0, 114, 189]/255,...
%         'MarkerFaceColor', [0, 114, 189]/255);
% scatter(MatrixForWeiPbBa(:, 1), MatrixForWeiPbBa(:, 2), 14, 'LineWidth', 0.5,...
%         'Marker', 'h',...
%         'MarkerEdgeColor', [162, 20, 46]/255,...
%         'MarkerFaceColor', [162, 20, 46]/255);
% xlim([-10.5, 10.5]);
% ylim([-10.5, 10.5]);
% set(gca, 'linewidth', 1)
% 
% plot(ellipse_XWei, ellipse_YWei, 'Color', [0, 102, 255]/255,...
%     'LineStyle', '-', 'LineWidth', 2),
% % 
% % % 第一主轴方向
% % % arrow_1 = annotation('arrow', 'Color', [162, 20, 47]/255,...
% % %     'HeadStyle', 'cback2', 'LineWidth', 3, 'HeadWidth', 20, 'HeadLength', 20);
% % % arrow_1.Parent = gca;
% % % arrow_1.X = [CenterForPCAWei(1, 1), p1(1, 1)];
% % % arrow_1.Y = [CenterForPCAWei(1, 2), p1(1, 2)];  
% % 
% % % 第二主轴方向
% % % arrow_2 = annotation('arrow', 'Color', [0, 114, 189]/255,...
% % %     'HeadStyle', 'cback2', 'LineWidth', 3, 'HeadWidth', 20, 'HeadLength', 20);
% % % arrow_2.Parent = gca;
% % % arrow_2.X = [CenterForPCAWei(1, 1), p2(1, 1)];
% % % arrow_2.Y = [CenterForPCAWei(1, 2), p2(1, 2)];  
% % 
% % % 中心点
% plot(CenterForPCAWei(1, 1), CenterForPCAWei(1, 2),...
%     'Marker', '*',...
%     'MarkerSize', 4,...
%     'MarkerEdgeColor', [162, 20, 46]/255,...
%     'MarkerFaceColor', [162, 20, 46]/255);
% 
%  text(2, -3, '95% 置信椭圆', 'FontSize', 10, 'FontWeight', 'normal')
%  xlabel('F1');
%  ylabel('F2');
%  legend('未风化高钾玻璃','未风化铅钡玻璃');
% axis equal
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
