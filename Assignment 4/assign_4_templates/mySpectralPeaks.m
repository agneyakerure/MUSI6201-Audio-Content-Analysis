function [spectralPeaks] = mySpectralPeaks(x)

%% Returns the top 20 spectral peak bins in the spectrum of x
% Input:
%   x:              N*1 float vector, input signal
% Output:
%   spectralPeaks:  20*1 float vector, bin indices of spectral peaks

% Check input dimensions 
[~,n] = size(x);
if (n>1)
    error('illegal input signal');
end

%% Please write your code here

spec = abs(fft(x));
[pks, ind1] = findpeaks(spec);
[~, ind2] = sort(pks, 'descend');

temp = zeros(20, 1);

for i = 1 : 20
    if length(ind2) < i
        temp(i) = NaN; 
    else
        temp(i) = ind1(ind2(i));    
    end
end

spectralPeaks = temp;

end