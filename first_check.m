%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In this first try, I want see how much is spent by day.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Show the progress (1/0)
verbose = 0;

% To load the data in sample.json (JSON database)
% just in MATLAB format:
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
    
    if verbose
        disp([num2str(i) '/' num2str(N) ])
    end
    
end




figure;
stem(t,s)
xlabel('days')
ylabel('Reais')
legend('Spend(day)')
grid

% It is possible to see a pattern spend by weekdays.
% Start on a thursday.
% we have (almost) 3 weeks!
% What more is important to check? May there are more
% things to check, but we must have focus, and what we
% have is enough to achive the data challenge.


%EOC



