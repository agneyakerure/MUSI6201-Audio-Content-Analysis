f1 = 441;
f2 = 882;
fs = 44100;
t = 0 : 1 / fs : 1 - 1/fs;
sine1 = sin(2 * pi * f1 * t);
sine2 = sin(2 * pi * f2 * t);
sinewave = [sine1, sine2];

[f0, timeInSec] = myPitchTrackAcf(sinewave', 1024, 512, 44100);

a1 = zeros(1, 173);
a1(1:86) = 441;
a1(87:173) = 882;
a1 = a1';
absoluteError = abs(f0 - a1);

stem(f0);

hold on;

plot(absoluteError, 'r');
%%
[x, fs] = audioread('63-M2_AMairena.wav');
annotation = dlmread('24-M1_AMairena-Martinete.f0.Corrected.txt');
annotation = annotation(:, 3);

[f0, timeInSec] = myPitchTrackAcf(x, 1024, 512, fs);
clc;
errCent_rms1 = myEvaluation(f0(1:length(annotation)), annotation);
plot(f0(1:length(annotation)));
hold on;
plot(annotation, 'k');
