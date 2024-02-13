% clear all,close all, clc
folder = [pwd,'\'];

[file_name,dir_name] = uigetfile(['\\mfad\researchmn\ULTRASOUND\SONG\SHARED\ForRyan\IBD_study\Processing_code\Main\*_BinaryResults_lowNLMs.mat'],'Select Blood Flow IQ data to process...','MultiSelect','off');
load([dir_name,file_name]); % load PD binary image

figure,
subplot(2,2,1)
imagesc(x,z,10*log10(abs(Crossmatrix)./max(abs(Crossmatrix(:)))),[-25 -5]),axis image;colormap(gray),colorbar
title('SubAper Intensity map')
set(gca,'FontSize',12,'FontWeight','bold')
axis off

%% resize the ROI map (from Bmode image) to match the Binary map
Nblock_a = 10; 
Nblock_l = 10;

roi_contour = edge(roi,'canny');
Bi_inroi = Bi.*roi;
roi_contour_matrix = repmat(roi_contour,[1,1,3]);
idx1 = find(roi_contour_matrix==1);
overlay_roi = overlay;
overlay_roi(idx1) = 1;


subplot(2,2,2),imagesc(x,z,overlay_roi,range);axis image
title('Overlaid with Bowel ROI'),xlabel('mm'),ylabel('mm')
set(gca,'FontWeight','bold')

subplot(2,2,3),imagesc(x,z,Bi),title('Original Binary map'),axis image,colormap(gray)
xlabel('mm'),ylabel('mm')
set(gca,'FontWeight','bold')

% vessel-length ratio
[row,col] = find(roi==1);
[colmin,idxmin] = min(col);
rowmin = row(idxmin(1));
[colmax,idxmax] = max(col);
rowmax = row(idxmax(1));
VesLen = sqrt((rowmax-rowmin)^2+(colmax-colmin)^2);
VesPixel = sum(Bi_inroi(:));
VLR = VesPixel/VesLen;

idxbi = find(roi_contour == 1);
Bi_inroi(idxbi) = 1;
subplot(2,2,4),imagesc(x,z,Bi_inroi),colormap(gray),axis image
xlabel('mm'),ylabel('mm')
set(gca,'FontWeight','bold')


% Vessel density
RoiPixel = sum(roi(:));
VAR = VesPixel/RoiPixel*100;
disp(['VD: ',num2str(VAR),'%'])
title(['VLR: ',num2str(round(VLR,2)), '; VD: ',num2str(round(VAR,2)),'%']),
set(gcf, 'Color', 'w'); % set white background




