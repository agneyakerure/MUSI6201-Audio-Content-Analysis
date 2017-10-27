f1 = 441;
f2 = 882;
fs = 44100;
t = 0 : 1 / fs : 1 - 1/fs;
sine1 = sin(2 * pi * f1 * t);
sine2 = sin(2 * pi * f2 * t);
mySineWave = [sine1, sine2];
mySineWave = mySineWave';

[f0, time] = myPitchTrackMax(mySineWave, 2048, 512, 44100);
figure(1)
plot(time, f0);
title('Sine Wave f0 with myPitchTrackMax');
xlabel('Time (s)')
ylabel('Frequency (Hz)')

diff = zeros(length(f0), 1);
len = length(diff);
for i = 1 : len
    val = 441;
    if (time(i) >= 1)
        val = 882;
    end
    diff(i) = abs(val - f0(i));
end
figure(2);
plot(time, diff);
title('Sine Wave Absolute Error with myPitchTrackMax');
xlabel('Time (s)')
ylabel('Absolute Error (Hz)')

[f0, time] = myPitchTrackHps(mySineWave, 1024, 512, 44100);
figure(3)
plot(time, f0);
title('Sine Wave f0 with myPitchTrackHps');
xlabel('Time (s)')
ylabel('Frequency (Hz)')

diff = zeros(length(f0), 1);
len = length(diff);
for i = 1 : len
    val = 441;
    if (time(i) >= 1)
        val = 882;
    end
    diff(i) = abs(val - f0(i));
end
figure(4);
plot(time, diff);
title('Sine Wave Absolute Error with myPitchTrackHps');
xlabel('Time (s)')
ylabel('Frequency (Hz)')

[~, ~, pf1, ~] = textread('01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[audio1, fs] = audioread('01-D_AMairena.wav');
est1 = myPitchTrackMax(audio1, 1024, 512, fs);
[rms1, pfp1, pfn1] = myEvaluation2(est1, pf1);

[~, ~, pf2, ~] = textread('24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[audio2, fs] = audioread('24-M1_AMairena-Martinete.wav');
est2 = myPitchTrackMax(audio2, 1024, 512, fs);
[rms2, pfp2, pfn2] = myEvaluation2(est2, pf2);

[~, ~, pf3, ~] = textread('63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[audio3, fs] = audioread('63-M2_AMairena.wav');
est3 = myPitchTrackMax(audio3, 1024, 512, fs);
[rms3, pfp3, pfn3] = myEvaluation2(est3, pf3);

disp('myPitchTrackMax - -40 - RMS PFP PFN')
disp('Audio File 1')
[rms1, pfp1, pfn1]
disp('Audio File 2')
[rms2, pfp2, pfn2]
disp('Audio File 3')
[rms3, pfp3, pfn3]


[~, ~, pf1, ~] = textread('01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[audio1, fs] = audioread('01-D_AMairena.wav');
est1 = myPitchTrackHps(audio1, 1024, 512, fs);
[rms1, pfp1, pfn1] = myEvaluation2(est1, pf1);

[~, ~, pf2, ~] = textread('24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[audio2, fs] = audioread('24-M1_AMairena-Martinete.wav');
est2 = myPitchTrackHps(audio2, 1024, 512, fs);
[rms2, pfp2, pfn2] = myEvaluation2(est2, pf2);

[~, ~, pitch_frequency3, ~] = textread('63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[audio3, fs] = audioread('63-M2_AMairena.wav');
est3 = myPitchTrackHps(audio3, 1024, 512, fs);
[rms3, pfp3, pfn3] = myEvaluation2(est3, pitch_frequency3);

fprintf('\n')

disp('myPitchTrackHps - -40 - RMS PFP PFN')
disp('Audio File 1')
[rms1, pfp1, pfn1]
disp('Audio File 2')
[rms2, pfp2, pfn2]
disp('Audio File 3')
[rms3, pfp3, pfn3]



[onset_seconds1, duration_seconds1, pf1, quantized_frequency1] = textread('01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[audio1, fs] = audioread('01-D_AMairena.wav');

acf40estimation1 = myPitchTrack(audio1, 1024, 512, fs, 'acf',-40);
max40estimation1 = myPitchTrack(audio1, 1024, 512, fs, 'max',-40);
hps40estimation1 = myPitchTrack(audio1, 1024, 512, fs, 'hps',-40);

acf20estimation1 = myPitchTrack(audio1, 1024, 512, fs, 'acf',-20);
max20estimation1 = myPitchTrack(audio1, 1024, 512, fs, 'max',-20);
hps20estimation1 = myPitchTrack(audio1, 1024, 512, fs, 'hps',-20);
[acf40rsm1, acf40pfp1, acf40pfn1] = myEvaluation2(acf40estimation1, pf1);
[max40rms1, max40pfp1, max40pfn1] = myEvaluation2(max40estimation1, pf1);
[hps40rms1, hpf40pfp1, hps40pfn1] = myEvaluation2(hps40estimation1, pf1);

[acf20rms1, acf20pfp1, acf20pfn1] = myEvaluation2(acf20estimation1, pf1);
[max20rms1, max20pfp1, max20pfn1] = myEvaluation2(max20estimation1, pf1);
[hps20rms1, hps20pfp1, hps20pfn1] = myEvaluation2(hps20estimation1, pf1);



[onset_seconds2, duration_seconds2, pf2, quantized_frequency2] = textread('24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[audio2, fs] = audioread('24-M1_AMairena-Martinete.wav');

acf40estimation2 = myPitchTrack(audio2, 1024, 512, fs, 'acf',-40);
max40estimation2 = myPitchTrack(audio2, 1024, 512, fs, 'max',-40);
hps40estimation2 = myPitchTrack(audio2, 1024, 512, fs, 'hps',-40);

acf20estimation2 = myPitchTrack(audio2, 1024, 512, fs, 'acf',-20);
max20estimation2 = myPitchTrack(audio2, 1024, 512, fs, 'max',-20);
hps20estimation2 = myPitchTrack(audio2, 1024, 512, fs, 'hps',-20);
[acf40rsm2, acf40pfp2, acf40pfn2] = myEvaluation2(acf40estimation2, pf2);
[max40rms2, max40pfp2, max40pfn2] = myEvaluation2(max40estimation2, pf2);
[hps40rms2, hpf40pfp2, hps40pfn2] = myEvaluation2(hps40estimation2, pf2);

[acf20rms2, acf20pfp2, acf20pfn2] = myEvaluation2(acf20estimation2, pf2);
[max20rms2, max20pfp2, max20pfn2] = myEvaluation2(max20estimation2, pf2);
[hps20rms2, hps20pfp2, hps20pfn2] = myEvaluation2(hps20estimation2, pf2);



[onset_seconds3, duration_seconds3, pitch_frequency3, quantized_frequency3] = textread('63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[audio3, fs] = audioread('63-M2_AMairena.wav');

acf40estimation3 = myPitchTrack(audio3, 1024, 512, fs, 'acf',-40);
max40estimation3 = myPitchTrack(audio3, 1024, 512, fs, 'max',-40);
hps40estimation3 = myPitchTrack(audio3, 1024, 512, fs, 'hps',-40);

acf20estimation3 = myPitchTrack(audio3, 1024, 512, fs, 'acf',-20);
max20estimation3 = myPitchTrack(audio3, 1024, 512, fs, 'max',-20);
hps20estimation3 = myPitchTrack(audio3, 1024, 512, fs, 'hps',-20);

[acf40rsm3, acf40pfp3, acf40pfn3] = myEvaluation2(acf40estimation3, pf3);
[max40rms3, max40pfp3, max40pfn3] = myEvaluation2(max40estimation3, pf3);
[hps40rms3, hpf40pfp3, hps40pfn3] = myEvaluation2(hps40estimation3, pf3);

[acf20rms3, acf20pfp3, acf20pfn3] = myEvaluation2(acf20estimation3, pf3);
[max20rms3, max20pfp3, max20pfn3] = myEvaluation2(max20estimation3, pf3);
[hps20rms3, hps20pfp3, hps20pfn3] = myEvaluation2(hps20estimation3, pf3);

fprintf('\n')

disp('myPitchTrackAcf - -40 - RMS PFP PFN')
disp('Audio File 1')
[acf40rsm1, acf40pfp1, acf40pfn1]
disp('Audio File 2')
[acf40rsm2, acf40pfp2, acf40pfn2]
disp('Audio File 3')
[acf40rsm3, acf40pfp3, acf40pfn3]

disp('myPitchTrackMax - -40 - RMS PFP PFN')
disp('Audio File 1')
[max40rms1, max40pfp1, max40pfn1]
disp('Audio File 2')
[max40rms2, max40pfp2, max40pfn2]
disp('Audio File 3')
[max40rms3, max40pfp3, max40pfn3]

disp('myPitchTrackHps - -40 - RMS PFP PFN')
disp('Audio File 1')
[hps40rms1, hpf40pfp1, hps40pfn1]
disp('Audio File 2')
[hps40rms2, hpf40pfp2, hps40pfn2]
disp('Audio File 3')
[hps40rms3, hpf40pfp3, hps40pfn3]

fprintf('\n')

disp('myPitchTrackAcf - -20 - RMS PFP PFN')
disp('Audio File 1')
[acf20rms1, acf20pfp1, acf20pfn1]
disp('Audio File 2')
[acf20rms2, acf20pfp2, acf20pfn2]
disp('Audio File 3')
[acf20rms3, acf20pfp3, acf20pfn3]

disp('myPitchTrackMax - -20 - RMS PFP PFN')
disp('Audio File 1')
[max20rms1, max20pfp1, max20pfn1]
disp('Audio File 2')
[max20rms2, max20pfp2, max20pfn2]
disp('Audio File 3')
[max20rms3, max20pfp3, max20pfn3]

disp('myPitchTrackHps - -20 - RMS PFP PFN')
disp('Audio File 1')
[hps20rms1, hps20pfp1, hps20pfn1]
disp('Audio File 2')
[hps20rms2, hps20pfp2, hps20pfn2]
disp('Audio File 3 ')
[hps20rms3, hps20pfp3, hps20pfn3]