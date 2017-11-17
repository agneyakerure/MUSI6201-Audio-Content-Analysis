f1 = 441;
f2 = 882;
fs = 44100;
t = 0 : 1 / fs : 1 - 1/fs;
sine1 = sin(2 * pi * f1 * t);
sine2 = sin(2 * pi * f2 * t);
sinewave = [sine1, sine2];
t = 0 : 1 / fs : 2 - 1/fs;
plot(t,sinewave');

%p = myPitchTrackAcf(sine', 2048, 1024, fs);