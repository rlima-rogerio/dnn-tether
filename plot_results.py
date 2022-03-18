import numpy as np
import pandas as pd
from sklearn.metrics import confusion_matrix
from sklearn.metrics import ConfusionMatrixDisplay
from sklearn.metrics import plot_confusion_matrix
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt

# Plots the Accuracy and training duration of networks
# python3 plot_results.py 
#-------------------------------------------------------------------------------------------
# To plot the confusion matrices, run the codes:
#   python3 main.py batch_evaluation {resnet, fcn, inception} {test, train} 
#

dataset_dir = '/home/lima/Documents/classes/ann/mnist/'
results_dir = '/home/lima/Documents/classes/ann/dl-4-tsc/results/'
trainfile = dataset_dir + 'train.csv'
testfile = dataset_dir + 'test.csv'
train = pd.read_csv(trainfile)
test = pd.read_csv(testfile)

root_dir = '/home/lima/Documents/classes/ann/dl-4-tsc'
archive_name = 'UCRArchive_2018'
dataset_name = 'Collision'
classifier_fcn = 'fcn'
classifier_resnet = 'resnet'
classifier_inception = 'inception'

results_dir_fcn = root_dir + '/results/' + classifier_fcn + '/' + archive_name  + '/' + \
                       dataset_name + '/'

results_dir_resnet = root_dir + '/results/' + classifier_resnet + '/' + archive_name  + '/' + \
                       dataset_name + '/'

results_dir_inception = root_dir + '/results/' + classifier_inception + '/' + archive_name + '/' + \
                       dataset_name + '/'

# datasets_dict = read_dataset(root_dir, archive_name, dataset_name)

y_true = pd.read_csv(testfile, usecols = [0])

# Load prediction results
# y_pred_fcn = np.load(results_dir_fcn + 'y_pred.npy')
# y_pred_resnet = np.load(results_dir_resnet + 'y_pred.npy')
# y_pred_inception = np.load(results_dir_inception + 'y_pred.npy')

# Load history results
history_fcn = pd.read_csv(results_dir_fcn + 'history.csv')
history_resnet = pd.read_csv(results_dir_resnet + 'history.csv')
history_inception = pd.read_csv(results_dir_inception + 'history.csv')

print(history_fcn)

# Plot metric loss
lw = 0.9
alpha = 0.99
metric = 'accuracy'
f, (ax1, ax2) = plt.subplots(1, 2, sharey=True, figsize = (10, 5))

ax1.plot(history_fcn[metric], linewidth=lw, alpha=alpha)
ax1.plot(history_resnet[metric], linewidth=lw, alpha=alpha)
ax1.plot(history_inception[metric], linewidth=lw, alpha=alpha)
ax1.set_title('Train')
ax1.grid(color = 'gray', linestyle = '--', linewidth = 0.3)
f.text(0.06, 0.5, 'Accuracy', ha='center', va='center', rotation='vertical',fontsize='large')

ax2.plot(history_fcn['val_' + metric], linewidth=lw, alpha=alpha)
ax2.plot(history_resnet['val_' + metric], linewidth=lw, alpha=alpha)
ax2.plot(history_inception['val_' + metric], linewidth=lw, alpha=alpha)
ax2.set_title('Validation')
ax2.grid(color = 'gray', linestyle = '--', linewidth = 0.3)
f.text(0.5, 0.04, 'Epoch', ha='center', va='center', fontsize='large')

plt.legend(['FCN', 'ResNet', 'Inception'], loc='lower right')
plt.savefig(results_dir + 'accuracies.png', bbox_inches='tight')
# plt.show()

# Load df_metrics results
metrics_fcn = pd.read_csv(results_dir_fcn + 'df_metrics.csv')
metrics_resnet = pd.read_csv(results_dir_resnet + 'df_metrics.csv')
metrics_inception = pd.read_csv(results_dir_inception + 'df_metrics.csv')


print(metrics_fcn.iloc[0]['duration'])
print(metrics_resnet.iloc[0]['duration'])
print(metrics_inception.iloc[0]['duration'])



network = ['FCN', 'ResNet', 'Inception']
duration = [metrics_fcn.iloc[0]['duration'],metrics_resnet.iloc[0]['duration'], metrics_inception.iloc[0]['duration']]

fig = plt.figure(figsize = (10, 5))
 
# creating the bar plot
plt.bar(network, duration, color ='blue',
        width = 0.4)
 
plt.xlabel("Networks")
plt.ylabel("Duration (sec)")
plt.title("Training Duration")
plt.grid(color = 'gray', linestyle = '--', linewidth = 0.3)
plt.savefig(results_dir + 'duration.png', bbox_inches='tight')
plt.show()
