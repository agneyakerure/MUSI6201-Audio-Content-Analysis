function  [pitchInMidi] = myFreq2MidiPitch(pitchInHz)

%% Converts fundamental pitch in Hz to pitch in MIDI
% Input:
%   pitchInHz:		(N x 1) float vector, fundamental pitch in Hz
% Output:
%   pitchInMidi:    (Nx 1) float vector, pitch in MIDI

% Check input dimensions 
[~,n] = size(pitchInHz);
if (n>1)
    error('illegal input signal');
end

%% Please write your code here
len = length(pitchInHz);
pitchInMidi = zeros(len, 1);

for n = 1 : len
    if pitchInHz(n) ~= 0
        pitchInMidi(n) = 69 + (12 * log2(pitchInHz(n)/440));
    else
        pitchInMidi(n) = 0;
    end
end

end