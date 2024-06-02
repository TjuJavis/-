%% ���Ƶ�������ͼ�����ɫ
%% ׼������
close all;
% load data.mat;

% data = data(:, 1:4);
data = [randn(100,1)*0.01 + 0.995 randn(100,1)*0.01 + 0.993 randn(100,1)*0.01 + 0.993 randn(100,1)*0.01 + 0.995];

% data = [randn(100,1)*0.01 + 0.995 randn(100,1)*0.01 + 0.995 randn(100,1)*0.01 + 0.995 randn(100,1)*0.01 + 0.995];
[row, col] = size(data);

for i = 1:row
    for j = 1:col
        if data(i,j) >= 1
            data(i,j) = 0.993; % �����ڵ���1��������Ϊ1-eps
        end
    end
end


% ��������ÿ�����֮��ı�ǩ
X ={' ','December','January', 'February', 'April'};
%% ���û�ͼ����Ϊ��ɫ
figure('color',[1 1 1]);
%% ������ɫ
mycolor1 = [220 211 30;180 68 108;242 166 31;244 146 121;59 125 183]./255;
mycolor2 = [255 255 0;254 0 0;85 160 251;126 126 126;255 255 255]./255;
mycolor3 = [250 221 214;130 130 130;255 255 255;100 195 191;232 245 176]./255;
mycolor4 = [255 255 255;131 131 131;0 0 254;131 131 131;255 255 255]./255;


%% ��ʼ��ͼ
%��������Ϊ���ݾ�����ɫ���á���Ƿ�
box_figure = boxplot(data,'color',[0 0 0],'Symbol','ro');

% ������Ⱥ����ֵ
q1 = quantile(data, 0.25); % ���ķ�λ��
q3 = quantile(data, 0.75); % ���ķ�λ��
iqr = q3 - q1; % �ķ�λ��
lower_bound = q1 - 1.5*iqr; % �½�
upper_bound = q3 + 1.5*iqr; % �Ͻ�
% 
% % �����Ⱥ��
outliers = data(data < lower_bound | data > upper_bound);
% hold on;
% plot(ones(size(outliers)), outliers, 'ro', 'MarkerSize', 8);
% hold off;

disp('��Ⱥ��ռ�ȣ�');
disp(numel(outliers)/numel(data)*100);


%�����߿�
set(box_figure,'Linewidth',1.2);
boxobj = findobj(gca,'Tag','Box');
for i = 1:3
    patch(get(boxobj(i),'XData'),get(boxobj(i),'YData'),mycolor1(i,:),'FaceAlpha',0.5,...
        'LineWidth',1.1);
end
hold on;
%% ������������Ĳ���
xlabel('����','Fontsize',10,'FontWeight','bold','FontName','����');
ylabel('��ֵ','Fontsize',10,'FontWeight','bold','FontName','����');
title('������ɫ��ʽͼ','Fontsize',10,'FontWeight','bold','FontName','����');
set(gca,'Linewidth',1.1); %�������������߿�
set(gca,'Fontsize',11); % ���������������С
% ��X��̶�����ʾ��Χ����
set(gca,'Xlim',[0.5 4.5], 'Xtick', [0:1:4],'Xticklabel',X);
% ��Y��̶�����ʾ��Χ����
set(gca,'YTick', 0.9:0.004:1,'Ylim',[0.9 1]);
% �Կ̶ȳ�����̶���ʾλ�õ���
set(gca, 'TickDir', 'in', 'TickLength', [.008 .008]);



set(gcf,'color','w') %���汳�����
xlim([x_min x_max]); %�����귶Χ
% xlabel('X');
% ylabel('Y');

title('Controlled Results', 'FontSize', 22, 'FontWeight', 'bold');
xlabel('Month','fontsize',22);
ylabel('Control Precision', 'FontSize', 22);
% legend('Optimal Lake Superior', 'Optimal Lake Michigan and Lake Huron', 'Optimal Lake Erie', 'Optimal Lake Ontario','Controlled Lake Superior', 'Controlled Lake Michigan and Lake Huron', 'Controlled Lake Erie', 'Controlled Lake Ontario','Location', 'northwest');

% months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
% xticks(1:12); % ���ú�����̶ȵ�
% xticklabels(months); % ���ú������עΪ�·ݵ���д��ʽ
set(gca, 'FontSize', 22 , 'FontName', 'Times New Roman');

