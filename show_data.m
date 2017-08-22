% Show and =lot the logs of the experiments
% Xinyu Liu @ VUB

clear

Reward = 1;
golog = 0;

log_folder_path = '/Users/walkerliu/Documents/03ETCS/RL/logs-home/figure_1/'
d = dir(log_folder_path);
isub = [d(:).isdir]; %# returns logical vector
name_folds = {d(isub).name}';
num_sub_folder = size(name_folds);
num_sub_folder = num_sub_folder(1);

if Reward
    cur_plot_file = 'test_avgR.log';
else
    cur_plot_file = 'test_quest1.log';
end

headerlinesIn = 1;

for ii = 3:num_sub_folder
    cur_sub = name_folds(ii)
    cur_folder = strcat(log_folder_path, cur_sub, '/');
    cur_file = strcat(cur_folder, cur_plot_file);
    cur_file = cur_file{1};
    
    delimiter = '\t';
    startRow = 2;
    formatSpec = '%f%[^\n\r]';
    fileID = fopen(cur_file,'r');
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    tmp_data =  dataArray{:, 1};
    if golog
        tmp_data = -log10(abs(tmp_data));
    end
    log_data(:, ii-2) = tmp_data(1:200,:);
end

figure(2); set(gca,'fontsize',16); hold on
plot(log_data); xlabel('epoch'); ylabel('Reward')
%axis([0 200 0 1.2])
%title('Quest for Home game');
legend(name_folds(3:num_sub_folder))
