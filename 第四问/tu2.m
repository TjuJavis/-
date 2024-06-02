%% ���Ƶ�������ͼ�����ɫ
%% ׼�����ݡ�������ʽͼ
load data.mat;
% ��������ÿ�����֮��ı�ǩ
X ={' ','M1','M2','M3','M4','M5'};
%% ���û�ͼ����Ϊ��ɫ
figure('color',[1 1 1]);
%% ������ɫ
mycolor1 = [220 211 30;180 68 108;242 166 31;244 146 121;59 125 183]./255;
mycolor2 = [255 255 0;254 0 0;85 160 251;126 126 126;255 255 255]./255;
mycolor3 = [250 221 214;130 130 130;255 255 255;100 195 191;232 245 176]./255;
mycolor4 = [255 255 255;131 131 131;0 0 254;131 131 131;255 255 255]./255


%% ��ʼ��ͼ
box_figure = boxplot(data,'color',[0 0 0],'Symbol','o');
set(box_figure,'Linewidth',1.2);
boxobj = findobj(gca,'Tag','Box');
for i = 1:5
    patch(get(boxobj(i),'XData'),get(boxobj(i),'YData'),mycolor4(i,:),'FaceAlpha',0.5,...
        'LineWidth',1.1);
end
hold on;
xlabel('����','Fontsize',10,'FontWeight','bold','FontName','����');
ylabel('��ֵ','Fontsize',10,'FontWeight','bold','FontName','����');
title('������ɫ��ʽͼ-������','Fontsize',10,'FontWeight','bold','FontName','����');
%% ������������Ĳ���
set(gca,'Linewidth',1.1); %�������������߿�
set(gca,'Fontsize',11); % ���������������С
% ��X��̶�����ʾ��Χ����
set(gca,'Xlim',[0.5 5.5], 'Xtick', [0:1:5.5],'Xticklabel',X);
% ��Y��̶�����ʾ��Χ����
set(gca,'YTick', 2:0.5:7.5,'Ylim',[2 7.5]);
% �Կ̶ȳ�����̶���ʾλ�õ���
set(gca, 'TickDir', 'in', 'TickLength', [.008 .008]);

%% ��ʼ��������������
hold on;
x1 = 1;
x2 = 2.9;
y1 = 6.1;
y2 = 6.2;
plot([x1,x1],[y1,y2],'k','Linewidth',1);
hold on;
plot([x2,x2],[y1,y2],'k','Linewidth',1);
hold on;
plot([x1,x2],[y2,y2],'k','Linewidth',1);
text((x1+x2)/2-0.1,y2+0.1,'**','Fontsize',22);
hold on;

x1 = 3.1;
x2 = 5;
y1 = 6.1;
y2 = 6.2;
plot([x1,x1],[y1,y2],'k','Linewidth',1);
hold on;
plot([x2,x2],[y1,y2],'k','Linewidth',1);
hold on;
plot([x1,x2],[y2,y2],'k','Linewidth',1);
text((x1+x2)/2-0.1,y2+0.1,'***','Fontsize',22);

hold on;
x1 = 1; 
x2 = 2.9;
y1 = 6.5;
y2 = 6.6;
plot([x1,x1],[y1,y2],'k','Linewidth',1);
hold on;
plot([x2,x2],[y1,y2],'k','Linewidth',1);
hold on;
plot([x1,x2],[y2,y2],'k','Linewidth',1);

hold on;
x1 = 3.1;
x2 = 5;
y1 = 6.5;
y2 = 6.6;
plot([x1,x1],[y1,y2],'k','Linewidth',1);
hold on;
plot([x2,x2],[y1,y2],'k','Linewidth',1);
hold on;
plot([x1,x2],[y2,y2],'k','Linewidth',1);

% �������һ������

hold on;
x1 = 2;
x2 = 4;
y1 = 6.6;
y2 = 7;
plot([x1,x1],[y1,y2],'k','Linewidth',1);
hold on;
plot([x2,x2],[y1,y2],'k','Linewidth',1);
hold on;
plot([x1,x2],[y2,y2],'k','Linewidth',1);
text((x1+x2)/2-0.1,y2+0.1,'**','Fontsize',22);

%% ���뱣���֡��ͼƬ
savefig(gcf,'boxplot_1.fig');
print(gcf,'result8','-dpng','-r600');