close all;
clear all, %close all,clc

% path(path,'H:\Mayo_documents\Journal_paper\Lok_IBD_pathology\')
filepath = '\\mfad\researchmn\ULTRASOUND\SONG\SHARED\ForUWai\Mayo Document\Journal_paper\Lok_IBD_pathology';
[num,txt,raw] = xlsread([filepath,'\SURG_ResultSummary.xlsx'],'VSX-MVI');
Adj_ALL_I = num(:,18);
VSX_long_VLR = num(:,5);
VSX_long_VD = num(:,6);
VSX_trans_VLR = num(:,7);
VSX_trans_VD = num(:,8);


%% Smyrk total Inflammation vs VSX_long_VLR
Exclude_index = [36 41 57 58 61]; %% no pathological results
Adj_ALL_I(Exclude_index) = [];
VSX_long_VLR (Exclude_index) = [];
VSX_long_VD (Exclude_index) = [];
VSX_trans_VLR (Exclude_index) = [];
VSX_trans_VD (Exclude_index) = [];
%% VLR_long vs pathological score
figure,plot(Adj_ALL_I,VSX_long_VLR,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
% xlabel('Pathology Inflammation'),
xlabel('Pathology inflammation score (%)'),
ylabel('VLR-UMI-Long ')
hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
axis([0 60 -2 16])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(VSX_long_VLR))),VSX_long_VLR(and(~isnan(Adj_ALL_I),~isnan(VSX_long_VLR))))

%% VLR_trans vs pathological score
figure,plot(Adj_ALL_I,VSX_trans_VLR,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
% xlabel('Pathology Inflammation'),
xlabel('Pathology inflammation score (%)'),
ylabel('VLR-UMI-Trans ')
hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
axis([0 60 -2 16])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(VSX_trans_VLR))),VSX_trans_VLR(and(~isnan(Adj_ALL_I),~isnan(VSX_trans_VLR))))


%% VD_Long vs pathological score

figure,plot(Adj_ALL_I,VSX_long_VD,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
xlabel('Pathology inflammation score (%)'),
ylabel('VD-UMI-Long')
% title('VD-Long (Proposed UMI) vs. Pathology Inflammation score')
hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
% axis([0 70 -2 16])
axis([0 60 0 45])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(VSX_long_VD))),VSX_long_VD(and(~isnan(Adj_ALL_I),~isnan(VSX_long_VD))))
length(VSX_long_VD(and(~isnan(Adj_ALL_I),~isnan(VSX_long_VD))))


%% VD_trans vs pathological score
figure,plot(Adj_ALL_I,VSX_trans_VD,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
% xlabel('Pathology Inflammation'),
% ylabel('VSX, Trans-VD ')
% title('VSX, Trans-VD vs. Pathology Inflammation')

xlabel('Pathology Inflammation score (%)'),
ylabel('VD-UMI-Trans')

hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
axis([0 60 0 45])
set(gcf, 'Color', 'w'); % set white background
grid on
corrcoef(Adj_ALL_I(and(~isnan(Adj_ALL_I),~isnan(VSX_trans_VD))),VSX_trans_VD(and(~isnan(Adj_ALL_I),~isnan(VSX_trans_VD))))
length(VSX_trans_VD(and(~isnan(Adj_ALL_I),~isnan(VSX_trans_VD))))


