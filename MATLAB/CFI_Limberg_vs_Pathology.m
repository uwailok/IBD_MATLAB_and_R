
clear all, close all,clc
filepath = '\\mfad\researchmn\ULTRASOUND\SONG\SHARED\ForPing\18-009825-IBD19\Report\SURG';
[num,txt,raw] = xlsread([filepath,'\SURG_ResultSummary.xlsx'],'VSX-MVI');
addpath('\\mfad\researchmn\ULTRASOUND\SONG\SHARED\ForPing\18-009825-IBD19\Post-Code\plotSpread\plotSpread'); 


%%
LimbergCF = num(:,1);LimbergCF = LimbergCF(1:44);
LimbergPD = num(:,2);
Adj_ALL_I = num(:,18);Adj_ALL_I = Adj_ALL_I(1:44);
%% limberg CF vs pathologh
path(path,'\\mfad\researchmn\ULTRASOUND\SONG\SHARED\ForPing\18-009825-IBD19\Post-Code\plotSpread')

L2 = 0.*ones(1, size(LimbergCF(LimbergCF==2),1));
L3 = 2.*ones(1, size(LimbergCF(LimbergCF==3),1));
L4 = 4.*ones(1, size(LimbergCF(LimbergCF==4),1));

LL2 = 2.*ones(1, size(LimbergCF(LimbergCF==2),1));
LL3 = 3.*ones(1, size(LimbergCF(LimbergCF==3),1));
LL4 = 4.*ones(1, size(LimbergCF(LimbergCF==4),1));
% corrcoef()

% Limber11 = [LL2 LL3 LL4];

Limber11 = [L2 L3 L4];
% (and(~isnan(Adj_ALL_I),~isnan(Limber11)))

dd_test = [Adj_ALL_I(LimbergCF==2)' Adj_ALL_I(LimbergCF==3)' Adj_ALL_I(LimbergCF==4)'];

[kkk mmm] = corr(dd_test(~isnan(dd_test))',Limber11(~isnan(dd_test))','Type','Spearman')


% corrcoef([Adj_ALL_I(LimbergCF==2)' Adj_ALL_I(LimbergCF==3)' Adj_ALL_I(LimbergCF==4)'],[LL2 LL3 LL4])
% 
Xpos = [0 2 4];
figure; 
hold on
plotSpread({Adj_ALL_I(LimbergCF==2)', Adj_ALL_I(LimbergCF==3)', Adj_ALL_I(LimbergCF==4)'},'distributionIdx',[L2 L3 L4])
set(gcf, 'Color', 'w');
set(gca,'FontSize',14,'fontWeight','bold')
h=boxplot([ Adj_ALL_I(LimbergCF==2)' Adj_ALL_I(LimbergCF==3)' Adj_ALL_I(LimbergCF==4)'],[ L2 L3 L4]','notch','off',...
    'Colors','k','width', 1,'positions',Xpos,'labels',{'Limberg=2','Limberg=3','Limberg=4'});
set(h,{'linew'},{2})
ylabel('Pathology inflammation (%)')
[h,p1] = ttest2(Adj_ALL_I(LimbergCF==2),Adj_ALL_I(LimbergCF==3))
[h,p2] = ttest2(Adj_ALL_I(LimbergCF==2),Adj_ALL_I(LimbergCF==4))
[h,p3] = ttest2(Adj_ALL_I(LimbergCF==3),Adj_ALL_I(LimbergCF==4))
% view([90 90])
