
close all;
clear all;
clc

DATASET = 'Collision';
CLASSIFIER = 'resnet';

cd results
cd(CLASSIFIER)
cd UCRArchive_2018_itr_8

histo = strcat(pwd,'/',DATASET,'/history.csv');
metrics  = strcat(pwd,'/',DATASET,'/df_metrics.csv');
% csvread(csv_file.csv,row_offset,col_offset)
dataHistory = csvread(histo,1,0); % loss,accuracy,val_loss,val_accuracy,lr
dataMetrics = csvread(metrics,1,0);

figure,
subplot(321), plot(dataHistory(:,1)); grid on; title('loss');
subplot(322), plot(dataHistory(:,2)); grid on; title('accuracy');
subplot(323), plot(dataHistory(:,3)); grid on; title('val-loss');
subplot(324), plot(dataHistory(:,4)); grid on; title('val-accuracy');
subplot(3,2,[5 6]), plot(dataHistory(:,5)); grid on; title('lr');

