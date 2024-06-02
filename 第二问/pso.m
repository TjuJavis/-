% web browser http://www.ilovematlab.cn/thread-62563-1-1.html
%% ��ջ�������
% clc
% clear
% close all;
%% ���ӳ�ʼ��
%����Ⱥ�㷨�е���������

close all;
c1=1.49445;
c2=1.49445;
%�����СȨֵ
wmax=0.9;
wmin=0.1;
%�����С�ٶ�
Vmax=0.03;
Vmin=-0.03;
%�����С����
popmax=0.3;
popmin=-0.3;

maxgen=50;    % ��������  
sizepop=20;   %��Ⱥ��ģ

%�������һ����Ⱥ
for i=1:sizepop   
    pop(i,:)=0.03*rand(1,45);  %�������
    fitness(i)=fun(pop(i,:));   %Ⱦɫ�����Ӧ��
    V(i,:)=0.003*rands(1,45);  %��ʼ���ٶ�
end

%% ��ʼ��Ⱥ��ֵ
%����õ�Ⱦɫ��
[bestfitness bestindex]=min(fitness);
zbest=pop(bestindex,:);   %ȫ�����
gbest=pop;    %�������
fitnessgbest=fitness;   %���������Ӧ��ֵ
fitnesszbest=bestfitness;   %ȫ�������Ӧ��ֵ

%% ����Ѱ��
for i=1:maxgen
    i
    for j=1:sizepop

        w=(wmax-wmin)*(i-1)/(maxgen)+wmin;   %Ȩֵ���Ա仯
        V(j,:)=w*V(j,:) + c1*rand*(gbest(j,:) - pop(j,:)) + c2*rand*(zbest - pop(j,:));   %�ٶȸ���
        V(j,find(V(j,:)>Vmax))=Vmax;   %С������ٶ�
        V(j,find(V(j,:)<Vmin))=Vmin;   %������С�ٶ�
        %��Ⱥ����
        pop(j,:)=pop(j,:)+0.5*V(j,:);
        for k=1:45
            if rand>0.95
                pop(j,k)=0.3*rand;   %����Ӧ����
            end
        end
        pop(j,find(pop(j,:)>popmax))=popmax;       %С�ڸ������ֵ
        pop(j,find(pop(j,:)<popmin))=popmin;       %���ڸ�����Сֵ

        %��Ӧ��ֵ
        fitness(j)=fun(pop(j,:));
    end
    
    for j=1:sizepop
        %���弫ֵ����
        if fitness(j)<fitnessgbest(j)
            gbest(j,:) = pop(j,:);
            fitnessgbest(j) = fitness(j);
        end

        %ȫ�ּ�ֵ����
        if fitness(j)<fitnesszbest
            zbest = pop(j,:);
            fitnesszbest = fitness(j);
        end
    end
    
    %��¼������Ӧ��ֵ
    yy(i)=fitnesszbest;

end

%% ���Ÿ������
% figure(1)
% plot(yy)
% title('����Ⱥ�㷨��������');
% xlabel('��������');ylabel('��Ӧ��');

individual=zbest;

w11=reshape(individual(1:6),3,2);
w12=reshape(individual(7:12),3,2);
w13=reshape(individual(13:18),3,2);

w21=individual(19:27);
w22=individual(28:36);
w23=individual(37:45);

rate1=0.006;rate2=0.001; %ѧϰ��
k=0.3;K=3;
y_1=zeros(3,1);y_2=y_1;y_3=y_2;   %���ֵ
u_1=zeros(3,1);u_2=u_1;u_3=u_2;   %������
h1i=zeros(3,1);h1i_1=h1i;  %��һ��������
h2i=zeros(3,1);h2i_1=h2i;  %�ڶ���������
h3i=zeros(3,1);h3i_1=h3i;  %������������
% h4i=zeros(3,1);h4i_1=h4i;  %���ĸ�������
% h5i=zeros(3,1);h5i_1=h5i;  %�����������
x1i=zeros(3,1);x2i=x1i;x3i=x2i;x1i_1=x1i;x2i_1=x2i;x3i_1=x3i;   %��������� 

%Ȩֵ��ʼ��
k0=0.03;

%ֵ�޶�
ynmax=1;ynmin=-1;  %ϵͳ���ֵ�޶�
xpmax=1;xpmin=-1;  %P�ڵ�����޶�
qimax=1;qimin=-1;  %I�ڵ�����޶�
qdmax=1;qdmin=-1;  %D�ڵ�����޶�
uhmax=1;uhmin=-1;  %�������޶�

for k=1:1:200

    %--------------------------------����ǰ�����--------------------------
    
    %ϵͳ���
    y1(k)=(0.4*y_1(1)+u_1(1)/(1+u_1(1)^2)+0.2*u_1(1)^3+0.5*u_1(2))+0.3*y_1(2);
    y2(k)=(0.2*y_1(2)+u_1(2)/(1+u_1(2)^2)+0.4*u_1(2)^3+0.2*u_1(1))+0.3*y_1(3);
    y3(k)=(0.3*y_1(3)+u_1(3)/(1+u_1(3)^2)+0.4*u_1(3)^3+0.4*u_1(2))+0.3*y_1(1);
   %% 
    r1(k)=0.7;r2(k)=0.4;r3(k)=0.6;  %����Ŀ��
    r4=r3;
    y4=y3-0.02;

    % r1(k)=180;r2(k)=110;r3(k)=70;  %����Ŀ��   
    %ϵͳ�������
    yn=[y1(k),y2(k),y3(k)];
    yn(find(yn>ynmax))=ynmax;
    yn(find(yn<ynmin))=ynmin;
    
    %��������
    x1o=[r1(k);yn(1)];x2o=[r2(k);yn(2)];x3o=[r3(k);yn(3)];
    
    %������ 
    x1i=w11*x1o;
    x2i=w12*x2o;
    x3i=w13*x3o;

    %������ԪP����
    xp=[x1i(1),x2i(1),x3i(1)];
    xp(find(xp>xpmax))=xpmax;
    xp(find(xp<xpmin))=xpmin;
    qp=xp;
    h1i(1)=qp(1);h2i(1)=qp(2);h3i(1)=qp(3);

    %������ԪI����
    xi=[x1i(2),x2i(2),x3i(2)];
    qi=[0,0,0];qi_1=[h1i(2),h2i(2),h3i(2)];
    qi=qi_1+xi;
    qi(find(qi>qimax))=qimax;
    qi(find(qi<qimin))=qimin;
    h1i(2)=qi(1);h2i(2)=qi(2);h3i(2)=qi(3);

    %΢����ԪD����
    xd=[x1i(3),x2i(3),x3i(3)];
    qd=[0 0 0];
    xd_1=[x1i_1(3),x2i_1(3),x3i_1(3)];
    qd=xd-xd_1;
    qd(find(qd>qdmax))=qdmax;
    qd(find(qd<qdmin))=qdmin;
    h1i(3)=qd(1);h2i(3)=qd(2);h3i(3)=qd(3);

    %��������
    wo=[w21;w22;w23];
    qo=[h1i',h2i',h3i'];qo=qo';
    uh=wo*qo;
    uh(find(uh>uhmax))=uhmax;
    uh(find(uh<uhmin))=uhmin;
    u1(k)=uh(1);u2(k)=uh(2);u3(k)=uh(3);  %������
    
    %--------------------------------------���練������----------------------
    
    %�������
    error=[r1(k)-y1(k);r2(k)-y2(k);r3(k)-y3(k)];  
    error1(k)=error(1);error2(k)=error(2);error3(k)=error(3);
    J(k)=sqrt((error(1)^2+error(2)^2+error(3)^2)/3);   %������С
    ypc=[y1(k)-y_1(1);y2(k)-y_1(2);y3(k)-y_1(3)];
    uhc=[u_1(1)-u_2(1);u_1(2)-u_2(2);u_1(3)-u_2(3)];
    
    %������������Ȩֵ����

    %����w21
    Sig1=sign(ypc./(uhc(1)+0.00001));
    dw21=sum(error.*Sig1)*qo';  
    w21=w21+rate2*dw21;
    
    %����w22
    Sig2=sign(ypc./(uh(2)+0.00001));
    dw22=sum(error.*Sig2)*qo';
    w22=w22+rate2*dw22;
    
    %����w23
    Sig3=sign(ypc./(uh(3)+0.00001));
    dw23=sum(error.*Sig3)*qo';
    w23=w23+rate2*dw23;

    %������������Ȩֵ����
    delta2=zeros(3,3);
    wshi=[w21;w22;w23];
    for t=1:1:3
        delta2(1:3,t)=error(1:3).*sign(ypc(1:3)./(uhc(t)+0.00000001));
    end
    for j=1:1:3
        sgn(j)=sign((h1i(j)-h1i_1(j))/(x1i(j)-x1i_1(j)+0.00001));
    end
 
     s1=sgn'*[r1(k),y1(k)];
     wshi2_1=wshi(1:3,1:3);
     alter=zeros(3,1);
     dws1=zeros(3,2);
     for j=1:1:3
         for p=1:1:3
             alter(j)=alter(j)+delta2(p,:)*wshi2_1(:,j);
         end
     end
     
     for p=1:1:3
         dws1(p,:)=alter(p)*s1(p,:);
     end
     w11=w11+rate1*dws1;

     %����w12
    for j=1:1:3
        sgn(j)=sign((h2i(j)-h2i_1(j))/(x2i(j)-x2i_1(j)+0.0000001));
    end
    s2=sgn'*[r2(k),y2(k)];
    wshi2_2=wshi(:,4:6);
    alter2=zeros(3,1);
    dws2=zeros(3,2);
    for j=1:1:3
        for p=1:1:3
            alter2(j)=alter2(j)+delta2(p,:)*wshi2_2(:,j);
        end
    end
    for p=1:1:3
        dws2(p,:)=alter2(p)*s2(p,:);
    end
    w12=w12+rate1*dws2;
    
    %����w13
    for j=1:1:3
        sgn(j)=sign((h3i(j)-h3i_1(j))/(x3i(j)-x3i_1(j)+0.0000001));
    end
    s3=sgn'*[r3(k),y3(k)];
    wshi2_3=wshi(:,7:9);
    alter3=zeros(3,1);
    dws3=zeros(3,2);
    for j=1:1:3
        for p=1:1:3
            alter3(j)=(alter3(j)+delta2(p,:)*wshi2_3(:,j));
        end
    end
    for p=1:1:3
        dws3(p,:)=alter2(p)*s3(p,:);
    end
    w13=w13+rate1*dws3;

    %��������
    u_3=u_2;u_2=u_1;u_1=uh;
    y_2=y_1;y_1=yn;
    h1i_1=h1i;h2i_1=h2i;h3i_1=h3i;
    x1i_1=x1i;x2i_1=x2i;x3i_1=x3i;
end

time=0.001*(1:k);
figure(2)
subplot(4,1,1)
plot(time,r1,'r-',time,y1,'b-');
title('PID Neural Network Control', 'FontSize', 22, 'FontWeight', 'bold');
% xlabel('time','fontsize',22);
ylabel('Superior', 'FontSize', 22);
legend('Optimal Water Level','Actual Water Level Output','fontsize',22);
set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');
axis([0,0.2,0,1])


subplot(4,1,2)
plot(time,r3,'r-',time,y3,'b-');
%plot(time,r4,'r-',time,y4,'b-');  
% ylabel('������2');
% legend('����Ŀ��','ʵ�����','fontsize',12);


% title('PID Neural Network Control', 'FontSize', 22, 'FontWeight', 'bold');
% xlabel('time','fontsize',22);
ylabel('Michigan & Huron', 'FontSize', 22);
% legend('Optimal Water Level','Actual Water Level Output','fontsize',22);
set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');
axis([0,0.2,0,1])


subplot(4,1,3)
%plot(time,r3,'r-',time,y3,'b-');      
plot(time,r4,'r-',time,y4,'b-');  
% xlabel('ʱ��/s');
% ylabel('������3');
% legend('����Ŀ��','ʵ�����','fontsize',12);
axis([0,0.2,0,1])
% title('PID Neural Network Control', 'FontSize', 22, 'FontWeight', 'bold');
% xlabel('time','fontsize',22);
ylabel('Erie', 'FontSize', 22);
% legend('Optimal Water Level','Actual Water Level Output','fontsize',22);
set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');



subplot(4,1,4)
% plot(time,r4,'r-',time,y4,'b-');       
% xlabel('ʱ��/s');
% ylabel('������3');
% legend('����Ŀ��','ʵ�����','fontsize',12);
plot(time,r2,'r-',time,y2,'b-');
% title('PID Neural Network Control', 'FontSize', 22, 'FontWeight', 'bold');
xlabel('time','fontsize',22,'FontName', 'Times New Roman');
ylabel('Ontario', 'FontSize', 22);
% legend('Optimal Water Level','Actual Water Level Output','fontsize',22);
set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');
axis([0,0.2,0,1])


figure(4)
plot(time,J,'r-');
axis([0,0.1,0,0.5]);grid
title('The dynamic curve of the network learning objective function J ');
xlabel('time');ylabel('Controlling error');  
set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');
disp('�������');
(1-J(200))*100
% web browser http://www.ilovematlab.cn/thread-62563-1-1.html

%%
%  close all;
% % �������������
% 
% % ��ȡ����
% % [X,Y1]=demoData();
% 
% X=time;
% Y1=J;
% 
% hold on
% % ��ȡY�����ݷ�Χ
% 
% YY=Y1;
% YLim=[min(YY),max(YY)];
% 
% % ���첢��������
% [XMesh,YMesh]=meshgrid(X,linspace(YLim(1),YLim(2),1000));
% YMeshA=repmat(YY,[1000,1]);
% CMesh=nan.*XMesh;
% YMeshD=YMeshA-YLim(1);
% CMesh(YMesh>=YLim(1)&YMesh<=YMeshA)=YMeshD(YMesh>=YLim(1)&YMesh<=YMeshA);
% surf(XMesh,YMesh,XMesh.*0,'EdgeColor','none','CData',CMesh,'FaceColor','flat','FaceAlpha',.8)
% 
% % ������ɫ
% % colormap(turbo(32))
% % colormap(flipud(turbo(32)))
% 
% colormap(slanCM(100,32))
% %colormap(flipud(slanCM(136,32)))
% 
% colorbar
% 
% % ��������ͼ
% plot(X,YY,'LineWidth',1,'Color',[0,0,0])
% 
% % ������������
% defaultAxes()

% �������������

% ��ȡ����
% close all
% [X,Y1]=demoData();
X=time;
Y1=J;

hold on
% ��ȡY�����ݷ�Χ
YY=Y1;
YLim=[min(YY),max(YY)];

% ���첢��������
[XMesh,YMesh]=meshgrid(X,linspace(YLim(1),YLim(2),1000));
YMeshA=repmat(YY,[1000,1]);
CMesh=nan.*XMesh;
YMeshD=YMeshA-YLim(1);
CMesh(YMesh>=YLim(1)&YMesh<=YMeshA)=YMeshD(YMesh>=YLim(1)&YMesh<=YMeshA);
surf(XMesh,YMesh,XMesh.*0,'EdgeColor','none','CData',CMesh,'FaceColor','flat','FaceAlpha',.8)

% ������ɫ
colormap(turbo(32))
%colormap(slanCM(136,32))
colorbar

% ��������ͼ
plot(X,YY,'LineWidth',1,'Color',[0,0,0])

% ������������
defaultAxes()



axis([0,0.1,0,0.5]);grid
title('The Dynamic Curve Of The Network Learning Objective RMSE ', 'FontSize', 22, 'FontWeight', 'bold');
xlabel('time', 'FontSize', 22);
ylabel('Controlling error', 'FontSize', 22);  
set(gca, 'FontSize', 22, 'FontName', 'Times New Roman');


% % title('PID Neural Network Control', 'FontSize', 22, 'FontWeight', 'bold');
% % xlabel('time','fontsize',22);
% ylabel('Superior', 'FontSize', 22);
% legend('Optimal Water Level','Actual Water Level Output','fontsize',22);
% set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');
% axis([0,0.2,0,1])



function [X,Y1]=demoData()
X0=1:40;
%X0=time;
Y01=[0,1,3,2,4,5,7,6,21,15,...
    19,23,27,14,10,5,4,7,...
    5,8,3,9,11,22,29,31,...
    34,27,40,52,33,20,19,...
    16,14,60,55,54,66,70];
Y01=Y01./100;
%Y01=J;
%  Y02=[35,34,38,32,26,17,25,8,15,2,...
%     7,9,17,14,10,15,24,17,...
%     25,28,33,49,31,42,29,31,...
%     34,27,40,52,33,20,19,...
%     26,24,10,15,14,6,0];

X=linspace(1,200,2500);
Y1=interp1(X0,Y01,X,'cubic');
% Y2=interp1(X0,Y02,X,'cubic');
% Y3=X+3;
end

function defaultAxes
ax=gca;hold on;box on
ax.XGrid='on';
ax.YGrid='on';
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.LineWidth=.8;
ax.GridLineStyle='-.';
ax.FontName='Cambria';
ax.FontSize=12;
ax.GridAlpha=.03;
end
