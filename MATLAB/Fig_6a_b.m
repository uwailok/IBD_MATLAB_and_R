% close all;
% clear all, %close all,clc



%% VLR_CFI vs stricture without penetration complication
filepath = '\\mfad\researchmn\ULTRASOUND\SONG\SHARED\ForUWai\Mayo Document\Journal_paper\Lok_IBD_pathology';
[num,txt,raw] = xlsread([filepath,'\Stricture_without_complication.xlsx']);
path_new = num(:,2);
VLR_CFI_new = num(:,1);

figure,plot(path_new,VLR_CFI_new,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
% xlabel('Pathology Inflammation'),
% ylabel('VSX, Trans-VD ')
% title('VSX, Trans-VD vs. Pathology Inflammation')

xlabel('Pathology inflammation score (%)'),
ylabel('VLR-CFI-Long')

hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
axis([0 60 -2 30])
set(gcf, 'Color', 'w'); % set white background
grid on

corrcoef(path_new,VLR_CFI_new)


%% VLR_UMI vs stricture without penetration complication

path_new = num(:,4);
VLR_UMI_new = num(:,3);

figure,plot(path_new,VLR_UMI_new,'o','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
set(gca,'FontSize',12,'fontWeight','bold')
% xlabel('Pathology Inflammation'),
% ylabel('VSX, Trans-VD ')
% title('VSX, Trans-VD vs. Pathology Inflammation')

xlabel('Pathology inflammation score (%)'),
ylabel('VLR-UMI-Long')

hold on
h = lsline;
set(h(1),'color','r')
set(h(1),'LineWidth',1)
axis([0 60 -2 16])
set(gcf, 'Color', 'w'); % set white background
grid on

corrcoef(path_new,VLR_UMI_new)
