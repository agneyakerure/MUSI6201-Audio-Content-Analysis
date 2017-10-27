function [ y ] = mySine( freq, fs, length_in_s  )

%duration [s]
T=length_in_s;
%sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
Fs = fs;
%samples
N = T*Fs;
%samples vector
t = 0 : 1/Fs : T;
%Frequency [Hz]
Fn = freq;
%Signal
y = sin(Fn*2*pi*t);
y = y';

end
