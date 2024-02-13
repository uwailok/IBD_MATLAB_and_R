
clear all, %close all,clc
filepath = '\\mfad\researchmn\ULTRASOUND\SONG\SHARED\ForPing\18-009825-IBD19\Report\SURG';
[num,txt,raw] = xlsread([filepath,'\SURG_ResultSummary.xlsx'],'VSX-MVI');
Adj_ALL_I = num(1:end-1,18);
%%
[num,txt,raw] = xlsread([filepath,'\SURG_LE10_CFimage_VLR.xlsx'],'Sheet1');
LE10_long_VLR = num(:,4);
LE10_long_VD = num(:,8);
LE10_Trans_VLR = num(:,12);
LE10_Trans_VD = num(:,16);
Exclude_index = [36 41 57 58 61]; %% no pathological results
Adj_ALL_I(Exclude_index) = [];
LE10_long_VLR (Exclude_index) = [];
LE10_long_VD (Exclude_index) = [];
LE10_Trans_VLR (Exclude_index) = [];
LE10_Trans_VD (Exclude_index) = [];

%% Pathological Inflammation vs long VLR
figure,plot(Adj_ALL_I,LE10_long_VLR,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
xlabel('Pathology inflammation score (%)'),
ylabel('VLR-CFI-Long ')
% title('LE10, Long-VLR vs. Pathology Inflammation')
hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
% axis([0 70 -2 16])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(LE10_long_VLR))),LE10_long_VLR(and(~isnan(Adj_ALL_I),~isnan(LE10_long_VLR))))

%% Pathological Inflammation vs long VD
figure,plot(Adj_ALL_I,LE10_long_VD,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
xlabel('Pathology inflammation score (%)'),
ylabel('VD-CFI-Long ')
% title('LE10, Long-VD vs. Pathology Inflammation')
hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
% axis([0 70 -2 16])

axis([0 60 0 45])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(LE10_long_VD))),LE10_long_VD(and(~isnan(Adj_ALL_I),~isnan(LE10_long_VD))))

%% Pathological Inflammation vs Trans VLR
figure,plot(Adj_ALL_I,LE10_Trans_VLR,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
xlabel('Pathology inflammation score (%)'),
ylabel('VLR-CFI-Trans ')
% title('LE10, Trans-VLR vs. Pathology Inflammation')
hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
% axis([0 70 -2 16])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(LE10_Trans_VLR))),LE10_Trans_VLR(and(~isnan(Adj_ALL_I),~isnan(LE10_Trans_VLR))))

%% Pathological Inflammation vs Trans VD
figure,plot(Adj_ALL_I,LE10_Trans_VD,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
xlabel('Pathology inflammation score (%)'),
ylabel('VD-CFI-Trans ')
% title('LE10, Trans-VD vs. Pathology Inflammation')
hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
% axis([0 70 -2 16])
axis([0 60 0 45])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(LE10_Trans_VD))),LE10_Trans_VD(and(~isnan(Adj_ALL_I),~isnan(LE10_Trans_VD))))



