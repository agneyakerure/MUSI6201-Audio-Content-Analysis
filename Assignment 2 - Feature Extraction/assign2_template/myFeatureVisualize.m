% Script: myFeatureVisualize
% Write all your code for this part of the assignment here.
% You are free to write more functions of your own but make 
% sure that everything is performed within this script.

music = getMetaData('./music_wav', 1024, 256);
speech = getMetaData('./speech_wav', 1024, 256);
all = horzcat(music, speech);

[~, numMusic] = size(music);
[~, numSpeech] = size(speech);

normAll = zScoreNormalize(all);
normMusic = normAll(:, (1:numMusic));
normSpeech = normAll(:, ((numMusic + 1):(numMusic + numSpeech)));

musicCentroidMean = normMusic(1,:);
musicCentroidStd = normMusic(2,:);
musicRMSMean = normMusic(3,:);
musicRMSStd = normMusic(4,:);
musicZCRMean = normMusic(5,:);
musicZCRStd = normMusic(6,:);
musicCrestMean = normMusic(7,:);
musicCestStd = normMusic(8,:);
musicFluxMean = normMusic(9,:);
musicFluxStd = normMusic(10,:);
speechCentroidMean = normSpeech(1,:);
speechCentroidStd = normSpeech(2,:);
speechRMSMean = normSpeech(3,:);
speechRMSStd = normSpeech(4,:);
speechZCRMean = normSpeech(5,:);
speechZCRStd = normSpeech(6,:);
speechCrestMean = normSpeech(7,:);
speechCrestStd = normSpeech(8,:);
speechFluxMean = normSpeech(9,:);
speechFluxStd = normSpeech(10,:);

figure(1);
scatter(musicCentroidMean,musicCrestMean,80,'r','*')
hold all
scatter(speechCentroidMean,speechCrestMean,80,'b','filled')
xlabel('SC mean')
ylabel('SCR mean')
legend('music','speech')
title('Mean SC vs Mean SCR')

figure(2);
scatter(musicFluxMean,musicZCRMean,80,'r','*')
hold all
scatter(speechFluxMean,speechZCRMean,80,'b','filled')
xlabel('SF mean')
ylabel('ZCR mean')
legend('music','speech')
title('Mean SF vs Mean ZCR')

figure(3);
scatter(musicRMSMean,musicRMSStd,80,'r','*')
hold all
scatter(speechRMSMean,speechRMSStd,80,'b','filled')
xlabel('RMS mean')
ylabel('RMS std')
legend('music','speech')
title('Mean RMS vs std RMS')

figure(4);
scatter(musicZCRStd,musicCestStd,80,'r','*')
hold all
scatter(speechZCRStd,speechCrestStd,80,'b','filled')
xlabel('ZCR std')
ylabel('SCR std')
legend('music','speech')
title('std ZCR vs std SCR')

figure(5);
scatter(musicCentroidStd,musicFluxStd,80,'r','*')
hold all
scatter(speechCentroidStd,speechFluxStd,80,'b','filled')
xlabel('SC std')
ylabel('SF std')
legend('music','speech')
title('std SC vs std SF')