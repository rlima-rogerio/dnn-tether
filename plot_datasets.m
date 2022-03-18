% Plot datasets

clear all;
close all
clc

% DATASET = 'ACSF1';
% DATASET = 'Adiac';
% DATASET = 'AllGestureWiimoteX';
% DATASET = 'AllGestureWiimoteY';
% DATASET = 'AllGestureWiimoteZ';
% DATASET = 'ArrowHead';
% DATASET = 'Beef';
% DATASET = 'BeetleFly'      
% DATASET = 'BirdChicken'      
% DATASET = 'BME'      
% DATASET = 'Car'      
% DATASET = 'CBF'      
% DATASET = 'Chinatown'      
% DATASET = 'ChlorineConcentration';
% DATASET = 'CinCECGTorso'      
% DATASET = 'Coffee'      
% DATASET = 'Computers'      
% DATASET = 'CricketX'      
% DATASET = 'CricketY'      
% DATASET = 'CricketZ'      
% DATASET = 'Crop'      
% DATASET = 'DiatomSizeReduction'    
% DATASET = 'DistalPhalanxOutlineAgeGroup';
% DATASET = 'DistalPhalanxOutlineCorrect ';
% DATASET = 'DistalPhalanxTW'    
% DATASET = 'DodgerLoopDay'    
% DATASET = 'DodgerLoopGame'    
% DATASET = 'DodgerLoopWeekend'    
% DATASET = 'Earthquakes'    
% DATASET = 'ECG200'    
% DATASET = 'ECG5000'    
% DATASET = 'ECGFiveDays'    
% DATASET = 'ElectricDevices'    
% DATASET = 'EOGHorizontalSignal'    
% DATASET = 'EOGVerticalSignal'    
% DATASET = 'EthanolLevel'    
% DATASET = 'FaceAll'    
% DATASET = 'FaceFour'    
% DATASET = 'FacesUCR'    
% DATASET = 'FiftyWords'    
% DATASET = 'Fish'    
% DATASET = 'FordA'    
% DATASET = 'FordB'    
% DATASET = 'FreezerRegularTrain ';
% DATASET = 'FreezerSmallTrain';
% DATASET = 'Fungi';
% DATASET = 'GestureMidAirD1';
% DATASET = 'GestureMidAirD2';
% DATASET = 'GestureMidAirD3';
% DATASET = 'GesturePebbleZ1';
% DATASET = 'GesturePebbleZ2';
% DATASET = 'GunPoint';
% DATASET = 'GunPointAgeSpan';
% DATASET = 'GunPointMaleVersusFemale';
% DATASET = 'GunPointOldVersusYoung';
% DATASET = 'Ham';
% DATASET = 'HandOutlines';
% DATASET = 'Haptics';
% DATASET = 'Herring';
% DATASET = 'HouseTwenty';
% DATASET = 'InlineSkate';
% DATASET = 'InsectEPGRegularTrain';
% DATASET = 'InsectEPGSmallTrain';
% DATASET = 'InsectWingbeatSound';
% DATASET = 'ItalyPowerDemand';
% DATASET = 'LargeKitchenAppliances';
% DATASET = 'Lightning2';
% DATASET = 'Lightning7';
% DATASET = 'Mallat';
% DATASET = 'Meat';
% DATASET = 'MedicalImages';
% DATASET = 'MelbournePedestrian';
% DATASET = 'MiddlePhalanxOutlineAgeGroup';
% DATASET = 'MiddlePhalanxOutlineCorrect';
% DATASET = 'MiddlePhalanxTW';
% DATASET = 'Missing_value_and_variable_length_datasets_adjusted';
% DATASET = 'MixedShapesRegularTrain';
% DATASET = 'MixedShapesSmallTrain';
% DATASET = 'MoteStrain';
% DATASET = 'NonInvasiveFetalECGThorax1';
% DATASET = 'NonInvasiveFetalECGThorax2';
% DATASET = 'OliveOil';
% DATASET = 'OSULeaf';
% DATASET = 'PhalangesOutlinesCorrect';
% DATASET = 'Phoneme';
% DATASET = 'PickupGestureWiimoteZ';
% DATASET = 'PigAirwayPressure';
% DATASET = 'PigArtPressure';
% DATASET = 'PigCVP';
% DATASET = 'PLAID';
% DATASET = 'Plane';
% DATASET = 'PowerCons';
% DATASET = 'ProximalPhalanxOutlineAgeGroup';
% DATASET = 'ProximalPhalanxOutlineCorrect';
% DATASET = 'ProximalPhalanxTW';
% DATASET = 'RefrigerationDevices';
% DATASET = 'Rock';
% DATASET = 'ScreenType';
% DATASET = 'SemgHandGenderCh2';
% DATASET = 'SemgHandMovementCh2';
% DATASET = 'SemgHandSubjectCh2';
% DATASET = 'ShakeGestureWiimoteZ';
% DATASET = 'ShapeletSim';
% DATASET = 'ShapesAll';
% DATASET = 'SmallKitchenAppliances';
% DATASET = 'SmoothSubspace';
% DATASET = 'SonyAIBORobotSurface1';
% DATASET = 'SonyAIBORobotSurface2';
% DATASET = 'StarLightCurves';
% DATASET = 'Strawberry';
% DATASET = 'SwedishLeaf';
% DATASET = 'Symbols';
% DATASET = 'SyntheticControl';
% DATASET = 'ToeSegmentation1';
% DATASET = 'ToeSegmentation2';
% DATASET = 'race';
% DATASET = 'TwoLeadECG';
% DATASET = 'TwoPatterns';
% DATASET = 'UWaveGestureLibraryAll';
% DATASET = 'UWaveGestureLibraryX';
% DATASET = 'UWaveGestureLibraryY';
% DATASET = 'UWaveGestureLibraryZ';
% DATASET = 'Wafer';
% DATASET = 'Wine';
% DATASET = 'WordSynonyms';
% DATASET = 'Worms';
% DATASET = 'WormsTwoClass';
% DATASET = 'Yoga';
DATASET = 'Collision';


cd archives
cd UCRArchive_2018
cd(DATASET)
train = strcat(pwd,'/',DATASET,'_TRAIN.tsv');
test  = strcat(pwd,'/',DATASET,'_TEST.tsv');
dataTrain = load(train);
dataTest = load(test);

categories = dataTrain(:,1);
cat_unique = unique(categories);

figure, 
for k=1:length(cat_unique)
    idx = find(categories == cat_unique(k));
    subplot(length(cat_unique),1,k)
    if(~isempty(idx))
        for m=1:length(idx)
            plot(dataTrain(idx(m),:)); grid on; hold on;
        end
    end
end

