N=length(loss_KF);
loc=1;
loc2=2;
loc3=3;
method_bname='RKF-ST';
method_name='RKF-AGST (ours)';
x=1:N;
x=x./10;
k=1:20:N;
N=N/10;
subplot(2,1,1);
title_name='Time (s)';

plot(x,loss_KF(:,loc),'--^','MarkerIndices',k+3,'LineWidth', 1); %线性，颜色，标记

hold on
plot(x,loss_PF(:,loc),'--s','MarkerIndices',k+18,'LineWidth', 1);
%plot(x,loss_Huber(:,loc),'--d','MarkerIndices',k+9,'LineWidth', 1);
plot(x,loss_RKFGaussian(:,loc),'--+','MarkerIndices',k+12,'LineWidth', 1);
plot(x,loss_RKFST(:,loc),'--x','MarkerIndices',k+6,'LineWidth', 1)
plot(x,loss_RKFAdditive(:,loc),'-o','MarkerIndices',k+15,'LineWidth', 1)
hold off


axis( [0,N,0.6,2])
set(gca, 'FontSize', 11);
%legend('KF','PF','Huber KF','RKF-Gaussian',method_bname,method_name,'Location','SouthEast', 'FontName','Times New Roman','FontSize',8,'FontWeight','normal');   %右下角标注
xlabel(title_name, 'FontName','Times New Roman','FontSize',13,'FontWeight','normal')  %x轴坐标描述
ylabel('RMSE (m)', 'FontName','Times New Roman','FontSize',13,'FontWeight','normal') %y轴坐标描述
legend('KF','PF','RKF-Gaussian',method_bname,method_name,'Location','southeast', 'FontName','Times New Roman','FontSize',11,'FontWeight','normal')
subplot(2,1,2);
plot(x,loss_KF(:,loc2),'--^','MarkerIndices',k+3,'LineWidth', 1); %线性，颜色，标记

hold on
plot(x,loss_PF(:,loc2),'--s','MarkerIndices',k+18,'LineWidth', 1);
%plot(x,loss_Huber(:,loc2),'--d','MarkerIndices',k+9,'LineWidth', 1);
plot(x,loss_RKFGaussian(:,loc2),'--+','MarkerIndices',k+12,'LineWidth', 1);
plot(x,loss_RKFST(:,loc2),'--x','MarkerIndices',k+6,'LineWidth', 1)
plot(x,loss_RKFAdditive(:,loc2),'-o','MarkerIndices',k+15,'LineWidth', 1)
hold off
%title('RKHS-DA AND SLDARKHS-DA');
%axis( [1,5,0,5])%axis( [0,110,50,100])  %确定x轴与y轴框图大小
%set(gca,'XTick',[x]) %x轴范围
%set(gca,'YTick',[50:10:100]) %y轴范围
axis( [0,N,0.6,2])
set(gca, 'FontSize', 11);
%legend('KF','PF','Huber KF','RKF-Gaussian',method_bname,method_name,'Location','SouthEast', 'FontName','Times New Roman','FontSize',8,'FontWeight','normal');   %右下角标注
xlabel(title_name, 'FontName','Times New Roman','FontSize',13,'FontWeight','normal')  %x轴坐标描述
ylabel('MAE (m)', 'FontName','Times New Roman','FontSize',13,'FontWeight','normal') %y轴坐标描述
legend('KF','PF','RKF-Gaussian',method_bname,method_name,'Location','southeast', 'FontName','Times New Roman','FontSize',11,'FontWeight','normal')
% subplot(2,1,3);
% plot(x,loss_KF(:,loc3),'--^b',x,loss_PF(:,loc3),'--sk',x,loss_Huber(:,loc3),'--dg',x,loss_RKFGaussian(:,loc3),'--+m',x,loss_RKFST(:,loc3),'--xc',x,loss_RKFAdditive(:,loc3),'-or','MarkerIndices',k); %线性，颜色，标记
% %title('RKHS-DA AND SLDARKHS-DA');
% axis( [0,N,0,25])  %确定x轴与y轴框图大小
% %set(gca,'XTick',[x]) %x轴范围
% %set(gca,'YTick',[0:10:400]) %y轴范围[0.13,0.05,0.74,0.05]
% set(gca, 'FontSize', 11);
% %legend('KF','PF','Huber KF','RKF-Gaussian',method_bname,method_name,'Location','SouthEast', 'FontName','Times New Roman','FontSize',8,'FontWeight','normal');   %右下角标注
% xlabel(title_name, 'FontName','Times New Roman','FontSize',13,'FontWeight','normal')  %x轴坐标描述
% ylabel('ANEE ', 'FontName','Times New Roman','FontSize',13,'FontWeight','normal') %y轴坐标描述
% 
% 
% legend('KF','PF','Huber KF','RKF-Gaussian',method_bname,method_name,'Location','southeast', 'FontName','Times New Roman','FontSize',11,'FontWeight','normal')