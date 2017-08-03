%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Show the results of the estimation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
close all

load results.mat

figure;
hold on
title('Mean, s.d., min, max')
errorbar(WD,results(:,1),results(:,2),':ok','LineWidth',LW,'MarkerSize',MS)
plot(WD,results(:,3),'xb','LineWidth',LW,'MarkerSize',MS)
plot(WD,results(:,4),'+r','LineWidth',LW,'MarkerSize',MS)
xlabel('Days of the week (start on Monday)')
ylabel('Estimation of spend')
legend('Mean','min','max')
hold off
grid

disp('The estimation for the spend values to next week is:')
WD = 'MTWTFSS';
for i=1:7
    disp([WD(i) ': ' num2str(results(i,1),'%.2f') ' (+-' num2str(results(i,2),'%.2f'),').' ]);
end