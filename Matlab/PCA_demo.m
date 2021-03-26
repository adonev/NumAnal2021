%%
set(0,'defaulttextInterpreter','latex')
set(0, 'defaultAxesTickLabelInterpreter','latex'); 
set(0, 'defaultLegendInterpreter','latex');
set(0, 'defaultLineLineWidth',3);
set(0,'defaultAxesFontSize',35)
clf


% Make 4 sets of data as Gaussian Clouds with different means
Set_1 = 0.5*randn(3,20) + repmat([0; 0; 10],1,20);
Set_2 = 2*randn(3,50) + repmat([0; 5; 5],1,50);
Set_3 = 0.5*randn(3,40) + repmat([0; 0; -5],1,40);
Set_4 = 1*randn(3,70);
Sets = [Set_1 Set_2 Set_3 Set_4];
Sets = Sets - mean(Sets,2);


% Plot all the data at once and view from above (can't see any stucture)
clf
plot3(Sets(1,:),Sets(2,:),Sets(3,:),'ko')
daspect([1 1 1])
view([0 90])
%%
% Plot all the data at once and view from above but color based on the
% original Gaussian cluster used to genreate it
% (Still can't see any stucture)
% Rotate plot to see structure
clf
plot3(Set_1(1,:),Set_1(2,:),Set_1(3,:),'ko')
hold all
plot3(Set_2(1,:),Set_2(2,:),Set_2(3,:),'mo')
hold all
plot3(Set_3(1,:),Set_3(2,:),Set_3(3,:),'ro')
hold all
plot3(Set_4(1,:),Set_4(2,:),Set_4(3,:),'bo')
daspect([1 1 1])
view([0 90])
%%

% plot data from above,rotated, and PCA

subplot(1,3,1);
plot3(Set_1(1,:),Set_1(2,:),Set_1(3,:),'ko')
hold all
plot3(Set_2(1,:),Set_2(2,:),Set_2(3,:),'mo')
hold all
plot3(Set_3(1,:),Set_3(2,:),Set_3(3,:),'ro')
hold all
plot3(Set_4(1,:),Set_4(2,:),Set_4(3,:),'bo')
daspect([1 1 1])
title('3D data (rotate)')

subplot(1,3,2)
plot(Set_1(1,:),Set_1(2,:),'ko')
hold all
plot(Set_2(1,:),Set_2(2,:),'mo')
hold all
plot(Set_3(1,:),Set_3(2,:),'ro')
hold all
plot(Set_4(1,:),Set_4(2,:),'bo')
daspect([1 1 1])
title('x-y projection')

% Actually do the PCA
[U_MATLAB,S_MATLAB,V_MATLAB] = svds(Sets',2);
PCA = (U_MATLAB*S_MATLAB)';

Set_1 = PCA(:,1:20);
Set_2 = PCA(:,21:20+50);
Set_3 = PCA(:,20+50+1:20+50+40);
Set_4 = PCA(:,20+50+40+1:end);


subplot(1,3,3)
plot(Set_1(1,:),Set_1(2,:),'ko')
hold all
plot(Set_2(1,:),Set_2(2,:),'mo')
hold all
plot(Set_3(1,:),Set_3(2,:),'ro')
hold all
plot(Set_4(1,:),Set_4(2,:),'bo')
daspect([1 1 1])
title('PCA projection')

if(0)
drawnow
subplot(1,3,1)
while true
   camorbit(0.1,0.1,'data',[0 1 0])
   drawnow
end
end
