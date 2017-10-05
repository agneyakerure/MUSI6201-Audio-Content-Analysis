f = 1000;
fs = 44100;
t = 0 : 1 / fs : 1 - 1 / fs;
sine = sin(2 * pi * f * t);

p = myPitchDetect(sine, fs);