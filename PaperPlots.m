%load time series data
modelData = load ('FinalModelData.dat'); %model data 6000 X 98
load 'q6hLongMat.dat'; %q6h data 25 X 288
load 'q24hLongMat.dat'; %q24h data 100 X 165
load 'LongS.dat';
load 'q6hLongS.dat';
load 'q24hLongS.dat';

% plot samples
figure;
h1 = subplot(3,2,1); %q6h longitudinal
plot((1:length(q6hLongMat(13,1:240)))/4,q6hLongMat(13,1:240),'r','LineWidth',2);
axis([0 60 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:2:8);
h2 = subplot(3,2,2); %q6h S
plot(1:25,(diag(q6hLongS)/sum(diag(q6hLongS)))*100,'bo','LineWidth',2);
axis([0 25 0 20]);
set(gca,'FontSize',12,'LineWidth',2);
h3 = subplot(3,2,3); %q24h longitudinal
plot(1:60,q24hLongMat(15,1:60),'r','LineWidth',2);
ylabel({'Log10 HSV DNA','(copy number/mL transport medium)'},'FontSize',12,'FontName','Arial');
axis([0 60 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:2:8);
h4 = subplot(3,2,4); %q24h S
plot((diag(q24hLongS)/sum(diag(q24hLongS)))*100,'bo','LineWidth',2);
ylabel('Variance(%)','FontSize',12,'FontName','Arial');
axis([0 100 0 15]);
set(gca,'FontSize',12,'LineWidth',2);
h5 = subplot(3,2,5); %model longitudinal
plot((1:6000)/100,modelData(:,2),'r','LineWidth',2);
xlabel('Days','FontSize',12,'FontName','Arial');
axis([0 60 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:2:8);
h6 = subplot(3,2,6); %model S
plot((diag(LongS)/sum(diag(LongS)))*100,'bo','LineWidth',2);
xlabel('Modes','FontSize',12,'FontName','Arial');
axis([0 98 0 10]);
set(gca,'FontSize',12,'LineWidth',2);

p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
width = p1(3) + p2(3) + (p2(1) - p1(1) -p1(3));
axes('position',[p1(1) p2(2) width height],'visible','off');
title('A','visible','on','FontSize',12,'FontWeight','bold','FontName','Arial');
set(gca,'FontSize',12);

p1=get(h3,'position');
p2=get(h4,'position');
height=p1(2)+p1(4)-p2(2);
width = p1(3) + p2(3) + (p2(1) - p1(1) -p1(3));
axes('position',[p1(1) p2(2) width height],'visible','off');
title('B','visible','on','FontSize',12,'FontWeight','bold','FontName','Arial');
set(gca,'FontSize',12);

p1=get(h5,'position');
p2=get(h6,'position');
height=p1(2)+p1(4)-p2(2);
width = p1(3) + p2(3) + (p2(1) - p1(1) -p1(3));
axes('position',[p1(1) p2(2) width height],'visible','off');
title('C','visible','on','FontSize',12,'FontWeight','bold','FontName','Arial');
set(gca,'FontSize',12);
% 
% % % NON MONOTONIC DECAY
load 'epiMatrix.mat'; %model data 10 X 1401
load 'q2hLongMat.dat'; %q2h data 8 X 51
load 'q6hSingleMat.dat' %q6h data 68 X 5
load 'q24hSingleMat.dat' %q24h data 23 X 21
load 'ModelNonMonotonicS.dat';
load 'q2hLongS.dat';
load 'q6hSingleS.dat';
load 'q24hSingleS.dat';
% 
figure;
h1 = subplot(4,2,1); %q2h single
plot((1:length(q2hLongMat(1,:)))/10,q2hLongMat(1,:),'r','LineWidth',2);
axis([0 4.5 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:2:8);
h2 = subplot(4,2,2); %q2h S
plot((diag(q2hLongS)/sum(diag(q2hLongS)))*100,'bo','LineWidth',2);
axis([1 8 0 60]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:20:60,'XTick',1:2:8);
h3 = subplot(4,2,3); %q6h single
plot((1:length(q6hSingleMat(:,1)))/4,q6hSingleMat(:,1),'r','LineWidth',2);
axis([0 10 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:2:8);
h4 = subplot(4,2,4); %q6h S
plot((diag(q6hSingleS)/sum(diag(q6hSingleS)))*100,'bo','LineWidth',2);
axis([1 5 0 70]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:20:70,'XTick',1:5);
h5 = subplot(4,2,5); %q24h longitudinal
plot(1:length(q24hSingleMat(:,2)),q24hSingleMat(:,2),'r','LineWidth',2);
axis([0 20 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:2:8,'XTick',0:2:20);
h6 = subplot(4,2,6); %q24h S
plot((diag(q24hSingleS)/sum(diag(q24hSingleS)))*100,'bo','LineWidth',2);
axis([1 21 0 50]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:20:50,'XTick',1:2:21);
h7 = subplot(4,2,7); %model single
plot((1:length(epiMatrix(3,:)))/100,epiMatrix(3,:),'r','LineWidth',2);
xlabel('Days','FontSize',12,'FontName','Arial');
axis([0 14 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:2:8,'XTick',0:2:14);
h8 = subplot(4,2,8); %model S
plot((diag(ModelNonMonotonicS)/sum(diag(ModelNonMonotonicS)))*100,'bo','LineWidth',2);
xlabel('Modes','FontSize',12,'FontName','Arial');
axis([1 10 0 70]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:20:70,'XTick',1:10);

p1=get(h1,'position'); %left bottom width height
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
width = p1(3) + p2(3) + (p2(1) - p1(1) -p1(3));
axes('position',[p1(1) p2(2) width height],'visible','off');
title('A','visible','on','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12);

p1=get(h3,'position');
p2=get(h4,'position');
height=p1(2)+p1(4)-p2(2);
width = p1(3) + p2(3) + (p2(1) - p1(1) -p1(3));
axes('position',[p1(1) p2(2) width height],'visible','off');
title('B','visible','on','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12);

p1=get(h5,'position');
p2=get(h6,'position');
height=p1(2)+p1(4)-p2(2);
width = p1(3) + p2(3) + (p2(1) - p1(1) -p1(3));
axes('position',[p1(1) p2(2) width height],'visible','off');
title('C','visible','on','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12);

p1=get(h7,'position');
p2=get(h8,'position');
height=p1(2)+p1(4)-p2(2);
width = p1(3) + p2(3) + (p2(1) - p1(1) -p1(3));
axes('position',[p1(1) p2(2) width height],'visible','off');
title('D','visible','on','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12);

p1=get(h1,'position');
p3=get(h3,'position');
p5=get(h5,'position');
p7=get(h7,'position'); %left bottom width height
p8=get(h8,'position');
height= p1(2)- p7(2) + p1(4);
width1 = p7(3);
width2 = p8(3);
axes('position',[p7(1) p7(2) width1 height],'visible','off');
ylabel({'Log10 HSV DNA','(copy number/mL transport medium)'},'visible','on','FontSize',12,'FontName','Arial');
set(gca,'FontSize',12);

axes('position',[p8(1) p8(2) width2 height],'visible','off');
ylabel('Variance(%)','visible','on','FontSize',12,'FontName','Arial');
set(gca,'FontSize',12);
 
% % % FIRST 4 MODE PLOTS
load 'ModelNonMonotonicV.dat'; %model data 1401 X 1401
load 'q2hLongU.dat'; %q2h 
load 'q6hSingleU.dat' %q6h data 68 X 5
load 'q24hSingleU.dat' %q24h data 23 X 21

figure;
h1 = subplot(2,2,1); %model 1st mode
plot((1:length(q2hLongU(:,1)))/10,q2hLongU(:,1),'r','LineWidth',2);
axis([0 5.5 0 0.2]); 
title('A','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12,'LineWidth',2);
h2 = subplot(2,2,2); %q6h 1st mode
plot((1:length(q6hSingleU(:,1)))/4,q6hSingleU(:,1),'r','LineWidth',2);
axis([0 14 0 0.2]); title('B','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12,'LineWidth',2,'XTick',0:2:14);
h3 = subplot(2,2,3); %q24h longitudinal
plot(1:length(q24hSingleU(:,1)),-q24hSingleU(:,1),'r','LineWidth',2);
axis([0 22 0 0.3]); title('C','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12,'LineWidth',2,'XTick',0:2:22);
h4 = subplot(2,2,4); %model 1st mode
plot((1:length(ModelNonMonotonicV(:,1)))/100,-ModelNonMonotonicV(:,1),'r','LineWidth',2);
axis([0 14 0 0.05]); title('D','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12,'LineWidth',2,'XTick',0:2:14);

p1 = get(h1,'position');
p3 = get(h3,'position');
p4 = get(h4,'position');
height = p1(2) - p3(2) + p1(4);
width = p4(1) - p3(1) + p4(3);
axes('position',[p3(1) p3(2) width height],'visible','off');
xlabel('Days','visible','on','FontSize',12,'FontName','Arial');
ylabel({'Log10 HSV DNA (a.u.)','(copy number/mL transport medium)'},'visible','on','FontSize',12,'FontName','Arial');
set(gca,'FontSize',12);
% 
% 
% % % LOW RANK APPROXIMATIONS - MODEL
load 'ModelNonMonotonicS.dat';
load 'ModelNonMonotonicU.dat';
load 'ModelNonMonotonicV.dat';
load 'epiMatrix.mat'; %model data 10 X 1401
Xapprox1 = ModelNonMonotonicS(1,1) * ModelNonMonotonicU(:,1) * ModelNonMonotonicV(:,1)';
Xapprox2 = Xapprox1 + ModelNonMonotonicS(2,2) * ModelNonMonotonicU(:,2) * ModelNonMonotonicV(:,2)';
Xapprox3 = Xapprox2 + ModelNonMonotonicS(3,3) * ModelNonMonotonicU(:,3) * ModelNonMonotonicV(:,3)';
Xapprox4 = Xapprox3 + ModelNonMonotonicS(4,4) * ModelNonMonotonicU(:,4) * ModelNonMonotonicV(:,4)';
figure;
h1 = subplot(4,2,1);
plot((1:size(epiMatrix,2))/100,epiMatrix(6,:),'r',(1:size(Xapprox1,2))/100,Xapprox1(6,:),'b--','LineWidth',2);
axis([0 13 0 8]);title('A','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8,'XTick',0:2:13);
h2 = subplot(4,2,3);
plot((1:size(epiMatrix,2))/100,epiMatrix(6,:),'r',(1:size(Xapprox2,2))/100,Xapprox2(6,:),'b--','LineWidth',2);
axis([0 13 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8,'XTick',0:2:13);
h3 = subplot(4,2,5);
plot((1:size(epiMatrix,2))/100,epiMatrix(6,:),'r',(1:size(Xapprox3,2))/100,Xapprox3(6,:),'b--','LineWidth',2);
axis([0 13 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8,'XTick',0:2:13);
h4 = subplot(4,2,7);
plot((1:size(epiMatrix,2))/100,epiMatrix(6,:),'r',(1:size(Xapprox4,2))/100,Xapprox4(6,:),'b--','LineWidth',2);
axis([0 13 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8,'XTick',0:2:13);
xlabel('Days','FontName','Arial');
legend('Actual Episode','Low Rank Approximation');

p1=get(h2,'position');
p2=get(h3,'position');
height=p1(2)+p1(4)-p2(2);
hAx=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');
h_label=ylabel({'Log10 HSV DNA','(copy number/mL transport medium)'},'visible','on','FontSize',12,'FontName','Arial');
set(gca,'FontSize',12);
% 
% % LOW RANK APPROXIMATIONS - q2h
load 'q2hLongS.dat';
load 'q2hLongU.dat';
load 'q2hLongV.dat';
load 'q2hLongMat.dat'; %model data 8 X 51
Xapprox1 = q2hLongS(1,1) * q2hLongU(:,1) * q2hLongV(:,1)';
Xapprox2 = Xapprox1 + q2hLongS(2,2) * q2hLongU(:,2) * q2hLongV(:,2)';
Xapprox3 = Xapprox2 + q2hLongS(3,3) * q2hLongU(:,3) * q2hLongV(:,3)';
Xapprox4 = Xapprox3 + q2hLongS(4,4) * q2hLongU(:,4) * q2hLongV(:,4)';
% figure;
h5 = subplot(4,2,2);
plot((1:size(q2hLongMat,2))/10,q2hLongMat(1,:),'r',(1:size(Xapprox1,1))/10,Xapprox1(:,1),'b--','LineWidth',2);
axis([0 4.5 0 8]);
title('B','FontSize',12,'FontName','Arial','FontWeight','bold');
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8);
h6 = subplot(4,2,4);
plot((1:size(q2hLongMat,2))/10,q2hLongMat(1,:),'r',(1:size(Xapprox2,1))/10,Xapprox2(:,1),'b--','LineWidth',2);
axis([0 4.5 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8);
h7 = subplot(4,2,6);
plot((1:size(q2hLongMat,2))/10,q2hLongMat(1,:),'r',(1:size(Xapprox3,1))/10,Xapprox3(:,1),'b--','LineWidth',2);
axis([0 4.5 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8);
h8 = subplot(4,2,8);
plot((1:size(q2hLongMat,2))/10,q2hLongMat(1,:),'r',(1:size(Xapprox4,1))/10,Xapprox4(:,1),'b--','LineWidth',2);
axis([0 4.5 0 8]);
set(gca,'FontSize',12,'LineWidth',2,'YTick',0:4:8);
xlabel('Days','FontName','Arial');
legend('Actual Episode','Low Rank Approximation');

p1=get(h1,'position'); %left bottom width height
p5=get(h5,'position');
width=p5(1)-p1(1) + p5(3);
axes('position',[p1(1) p1(2) width p1(4)],'visible','off');
title('Rank-1 Approximation','visible','on','FontSize',12,'FontName','Arial');

p1=get(h2,'position'); %left bottom width height
p5=get(h6,'position');
width=p5(1)-p1(1) + p5(3);
axes('position',[p1(1) p1(2) width p1(4)],'visible','off');
title('Rank-2 Approximation','visible','on','FontSize',12,'FontName','Arial');

p1=get(h3,'position'); %left bottom width height
p5=get(h7,'position');
width=p5(1)-p1(1) + p5(3);
axes('position',[p1(1) p1(2) width p1(4)],'visible','off');
title('Rank-3 Approximation','visible','on','FontSize',12,'FontName','Arial');

p1=get(h4,'position'); %left bottom width height
p5=get(h8,'position');
width=p5(1)-p1(1) + p5(3);
axes('position',[p1(1) p1(2) width p1(4)],'visible','off');
title('Rank-4 Approximation','visible','on','FontSize',12,'FontName','Arial');
% 
% % 
% % % LOW RANK APPROXIMATIONS - q6h
load 'q6hSingleS.dat';
load 'q6hSingleU.dat';
load 'q6hSingleV.dat';
load 'q6hSingleMat.dat'; %q6h data 68 X 5
Xapprox1 = q6hSingleS(1,1) * q6hSingleU(:,1) * q6hSingleV(:,1)';
Xapprox2 = Xapprox1 + q6hSingleS(2,2) * q6hSingleU(:,2) * q6hSingleV(:,2)';
Xapprox3 = Xapprox2 + q6hSingleS(3,3) * q6hSingleU(:,3) * q6hSingleV(:,3)';
Xapprox4 = Xapprox3 + q6hSingleS(4,4) * q6hSingleU(:,4) * q6hSingleV(:,4)';

figure;
subplot(4,1,1);
plot((1:size(q6hSingleMat,1))/4,q6hSingleMat(:,2),'r',(1:size(Xapprox1,1))/4,Xapprox1(:,2),'b--','LineWidth',2);
axis([0 10 0 10]);title('Rank-1 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
h1 = subplot(4,1,2);
plot((1:size(q6hSingleMat,1))/4,q6hSingleMat(:,2),'r',(1:size(Xapprox1,1))/4,Xapprox2(:,2),'b--','LineWidth',2);
axis([0 10 0 10]);title('Rank-2 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
h2 = subplot(4,1,3);
plot((1:size(q6hSingleMat,1))/4,q6hSingleMat(:,2),'r',(1:size(Xapprox1,1))/4,Xapprox3(:,2),'b--','LineWidth',2);
axis([0 10 0 10]);title('Rank-3 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
subplot(4,1,4);
plot((1:size(q6hSingleMat,1))/4,q6hSingleMat(:,2),'r',(1:size(Xapprox1,1))/4,Xapprox4(:,2),'b--','LineWidth',2);
axis([0 10 0 10]);title('Rank-4 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
xlabel('Days');
legend('Actual Episode','Low Rank Approximation');

p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
h3=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');
h_label=ylabel({'Log10 HSV DNA','(copy number/mL transport medium)'},'visible','on','FontSize',12);
set(gca,'FontSize',12);
% % 
% % %LOW RANK APPROXIMATIONS - q24h
load 'q24hSingleS.dat';
load 'q24hSingleU.dat';
load 'q24hSingleV.dat';
load 'q24hSingleMat.dat'; %q24h data 23 X 21
Xapprox1 = q24hSingleS(1,1) * q24hSingleU(:,1) * q24hSingleV(:,1)';
Xapprox2 = Xapprox1 + q24hSingleS(2,2) * q24hSingleU(:,2) * q24hSingleV(:,2)';
Xapprox3 = Xapprox2 + q24hSingleS(3,3) * q24hSingleU(:,3) * q24hSingleV(:,3)';
Xapprox4 = Xapprox3 + q24hSingleS(4,4) * q24hSingleU(:,4) * q24hSingleV(:,4)';

figure;
subplot(4,1,1);
plot((1:size(q24hSingleMat,1)),q24hSingleMat(:,15),'r',(1:size(Xapprox1,1)),Xapprox1(:,15),'b--','LineWidth',2);
axis([0 16 0 10]); title('Rank-1 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
h1 = subplot(4,1,2);
plot((1:size(q24hSingleMat,1)),q24hSingleMat(:,15),'r',(1:size(Xapprox1,1)),Xapprox2(:,15),'b--','LineWidth',2);
axis([0 16 0 10]);title('Rank-2 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
h2 = subplot(4,1,3);
plot((1:size(q24hSingleMat,1)),q24hSingleMat(:,15),'r',(1:size(Xapprox1,1)),Xapprox3(:,15),'b--','LineWidth',2);
axis([0 16 0 10]);title('Rank-3 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
subplot(4,1,4);
plot((1:size(q24hSingleMat,1)),q24hSingleMat(:,15),'r',(1:size(Xapprox1,1)),Xapprox4(:,15),'b--','LineWidth',2);
axis([0 16 0 10]);title('Rank-4 Approximation','FontSize',12);
set(gca,'FontSize',12,'LineWidth',2);
xlabel('Days');
legend('Actual Episode','Low Rank Approximation');
% 
p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
h3=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');
h_label=ylabel({'Log10 HSV DNA','(copy number/mL transport medium)'},'visible','on','FontSize',12);
set(gca,'FontSize',12);
% 
% 
% %LDA Result
figure;
subplot(2,1,1);
y0_pdf = load(strcat('y0PDF_T0_Fig5a.dat'));
y3_pdf = load(strcat('y3PDF_T0_Fig5a.dat'));
y7_pdf = load(strcat('y7PDF_T0_Fig5a.dat'));
y10_pdf = load(strcat('y10PDF_T0_Fig5a.dat'));
plot(y0_pdf/max(y0_pdf),'k','LineWidth',2.5,'LineStyle','-');
hold on;
plot(y3_pdf/max(y3_pdf),'k','LineWidth',2.5,'LineStyle','--');
hold on;
plot(y7_pdf/max(y7_pdf),'k','LineWidth',2.5,'LineStyle','-.');
hold on;
plot(y10_pdf/max(y10_pdf),'k','LineWidth',2.5,'LineStyle',':');
hold on;
axis([2*10^4 6*10^4 0 1]);
set(gca,'FontSize',12,'LineWidth',2.5);
xlabel('T0','FontName','Arial'); ylabel('p(T0)','FontName','Arial'); title('A','FontName','Arial','FontWeight','bold');
legend('0-2 days','3-6 days','7-9 days','>=10 days');

subplot(2,1,2);
y0_pdf = load(strcat('y0pdfTrial',num2str(2),'_Fig5b.dat'));
y3_pdf = load(strcat('y3pdfTrial',num2str(2),'_Fig5b.dat'));
y7_pdf = load(strcat('y7pdfTrial',num2str(2),'_Fig5b.dat'));
y10_pdf = load(strcat('y10pdfTrial',num2str(2),'_Fig5b.dat'));
plot(y0_pdf/max(y0_pdf),'k','LineWidth',2.5,'LineStyle','-');
hold on;
plot(y3_pdf/max(y3_pdf),'k','LineWidth',2.5,'LineStyle','--');
hold on;
plot(y7_pdf/max(y7_pdf),'k','LineWidth',2.5,'LineStyle','-.');
hold on;
plot(y10_pdf/max(y10_pdf),'k','LineWidth',2.5,'LineStyle',':');
hold on;
axis([2*10^4 7*10^4 0 1]);
set(gca,'FontSize',12,'LineWidth',2.5);
xlabel('y_i','FontName','Arial'); ylabel('p(y_i|w1)','FontName','Arial'); title('B','FontName','Arial','FontWeight','bold');
legend('0-2 days','3-6 days','7-9 days','>=10 days');
% 
% 
% 
% % % % %Scatter plot : gplotmatrix
totalX = load('totalX_Fig6.dat');
totalY = load('totalY_Fig6.dat');

[d,p,stats] = manova1(totalX',totalY);

% %sample gscatter plots for pairwise features
hfig = figure;
subplot(1,3,1);gscatter(totalX(1,:),sum(totalX(2:7,:))/6,totalY,'k','*vso',5); 
axis([0 max(totalX(1,:)) 0 max(sum(totalX(2:7,:))/6)]);set(gca,'FontSize',12,'LineWidth',2,'FontName','Arial'); xlabel('T0');ylabel('First Ring');
legend('0-2 days','3-6 days','7-9 days','>=10 days'); title('A','FontWeight','bold');
subplot(1,3,2);gscatter(totalX(4,:),totalX(7,:),totalY,'k','*vso',5); 
axis([0 max(totalX(4,:)) 0 max(totalX(7,:))]);set(gca,'FontSize',12,'LineWidth',2,'FontName','Arial'); xlabel('T3');ylabel('T6');
legend('0-2 days','3-6 days','7-9 days','>=10 days'); title('B','FontWeight','bold');
h = subplot(1,3,3);
hLine = plot([1.5 -3],[-4 3.5],'k','LineWidth',2);
set(get(get(hLine,'Annotation'),'LegendInformation'),'IconDisplayStyle','off'); % Exclude line from legend
set(gca,'FontSize',12,'LineWidth',2,'FontName','Arial');
xlabel('C1');ylabel('C2'); title('C','FontWeight','bold'); 
hold on;
scatter(stats.canon(totalY==1,1),stats.canon(totalY==1,2),30,'k*','LineWidth',1);
hold on;
scatter(stats.canon(totalY==2,1),stats.canon(totalY==2,2),30,'kv','LineWidth',1);
hold on;
scatter(stats.canon(totalY==3,1),stats.canon(totalY==3,2),30,'ks','LineWidth',1);
hold on;
scatter(stats.canon(totalY==4,1),stats.canon(totalY==4,2),30,'ko','LineWidth',1);
legend('0-2 days','3-6 days','7-9 days','>=10 days');

% %SECOND GENERATION scatter plots
trainingIC3SecondGen = load('trainingIC3SecondGen.dat');
trainingIC7SecondGen = load('trainingIC7SecondGen.dat');
trainingIC10SecondGen = load('trainingIC10SecondGen.dat');

totalXSecondGen = [trainingIC3SecondGen trainingIC7SecondGen trainingIC10SecondGen];
totalYSecondGen = [ones(size(trainingIC3SecondGen,2),1);2*ones(size(trainingIC7SecondGen,2),1);3*ones(size(trainingIC10SecondGen,2),1)];


% 
[d,p,stats] = manova1(totalXSecondGen',totalYSecondGen);
concatenate first gen and secondgen T-cell density
trainingIC3_19T0 = [trainingIC3(:,1:47);trainingIC3SecondGen(:,:)];
trainingIC7_19T0 = [trainingIC7(:,1:34);trainingIC7SecondGen(:,:)];
trainingIC10_19T0 = [trainingIC10(:,1:33);trainingIC10SecondGen(:,:)];
totalX_19T0 = [trainingIC3_19T0 trainingIC7_19T0 trainingIC10_19T0];
totalY_19T0 = [ones(size(trainingIC3_19T0,2),1);2*ones(size(trainingIC7_19T0,2),1);3*ones(size(trainingIC10_19T0,2),1)];

totalX_19T0 = load('totalX_19T0_Fig7a.dat');
totalY_19T0 = load('totalY_19T0_Fig7a.dat');
totalXSecondGen = load('totalXSecondGen_Fig7c.dat');
totalYSecondGen = load('totalYSecondGen_Fig7c.dat');
[d,p,stats] = manova1(totalXSecondGen',totalYSecondGen);
figure;
% % %sample gscatter plots for pairwise features
subplot(1,3,1);gscatter(totalX_19T0(1,:),sum(totalX_19T0(2:7,:))/6,totalY_19T0,'k','vso',5); 
axis([0 max(totalX_19T0(1,:)) 0 max(sum(totalX_19T0(2:7,:))/6)]);set(gca,'FontSize',12,'LineWidth',2,'FontName','Arial'); 
xlabel('T0');ylabel('First Ring');
legend('3-6 days','7-9 days','>=10 days'); title('A','FontWeight','bold');
subplot(1,3,2);gscatter(sum(totalX_19T0(2:7,:))/6,sum(totalX_19T0(8:18,:))/12,totalY_19T0,'k','vso',5); 
axis([0 max(sum(totalX_19T0(2:7,:))/6) 0 max(sum(totalX_19T0(8:18,:))/12)]);set(gca,'FontSize',12,'LineWidth',2,'FontName','Arial'); 
xlabel('First Ring');ylabel('Second Ring');
legend('3-6 days','7-9 days','>=10 days'); title('B','FontWeight','bold');
subplot(1,3,3);
hLine = plot([3 -3],[-4 4.25],'k','LineWidth',2);
set(get(get(hLine,'Annotation'),'LegendInformation'),'IconDisplayStyle','off'); % Exclude line from legend
set(gca,'FontSize',12,'LineWidth',2,'FontName','Arial');
xlabel('C1');ylabel('C2'); title('C','FontWeight','bold'); 
hold on;
scatter(stats.canon(totalYSecondGen==1,1),stats.canon(totalYSecondGen==1,2),30,'kv','LineWidth',1);
hold on;
scatter(stats.canon(totalYSecondGen==2,1),stats.canon(totalYSecondGen==2,2),30,'ks','LineWidth',1);
hold on;
scatter(stats.canon(totalYSecondGen==3,1),stats.canon(totalYSecondGen==3,2),30,'ko','LineWidth',1);
hold on;
legend('3-6 days','7-9 days','>=10 days');


% NON LINEAR CLASSIFIERS
