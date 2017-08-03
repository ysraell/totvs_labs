%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Now, I'll use a simple [mean +-(stantard deviation) min max]
% This would be more interesting if we had a large dataset for test.
% For while, I have only 3 weeks! 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load a conveted format of sample.txt.
load sample.mat

% Get the first day:
 temp =  data{1}.ide.dhEmi.x0x24_date;
 ini_day = [temp(6:7) '/' temp(9:10) '/' temp(1:4)];
% Get the last day:
 temp =  data{end}.ide.dhEmi.x0x24_date;
 end_day = [temp(6:7) '/' temp(9:10) '/' temp(1:4)];

% How much long...
total_days = daysact(ini_day,end_day)+1;
 
d = 1;            % Star on day 1
t = 1:total_days;  % x-axis: days
s = zeros(total_days,1);  % y-axis: spend(days) (Like a function f of x -> f(x))

% Search for all records building datra for analisys.
N = max(size(data));
for i=1:N    
    
    %first, we must take the date to check if is another day.
    temp =  data{i}.ide.dhEmi.x0x24_date;
    now_day = [temp(6:7) '/' temp(9:10) '/' temp(1:4)];
    
    % If is the next day, change the day!
    if daysact(ini_day,now_day)>0
        d=d+daysact(ini_day,now_day);
        ini_day = now_day;
    end
    s(d) = s(d)+data{i}.complemento.valorTotal;
    
end

% Create the estimation. NaN for the mnissing monday value and zero for the
% last sunday.
s_w = reshape([nan; s; 0],7,3);
results = [mean(s_w,2) std(s_w,[],2) min(s_w,[],2) max(s_w,[],2)];
results(1,1:2) = [mean(s_w(1,2:3),2) std(s_w(1,2:3),[],2)];
WD = 1:7;
  
LW =2;
MS = 10;

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
%EOC


save results.mat
