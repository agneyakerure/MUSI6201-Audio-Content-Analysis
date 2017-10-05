function [r] = myCompAcf (inputVector, bIsNormalized)

%% Computes the ACF of an input with optional normalization
% Input:
%   inputVector:	(N x 1) float vector, block of audio
%   bIsNormalized: 	bool variable for normalization of ACF 
% Output:
%   r:				(N x 1) float vector, ACF of the inputVector

% set uninitialized input arguments
if (nargin < 2)
    bIsNormalized = true;
end

% check input dimension
[m,n] = size(inputVector);
if ((m<=1 && n<=1) || (m>1 && n>1))
    error('illegal input vector');
end

%% Please insert your ACF computation code here
inputVector = inputVector';
% allocate memory for result
r = zeros(length(inputVector), 1)';

 % Effort 
% normalizationFactor = zeros(length(inputVector), 1)';

%  compute acf
%  enter code here
  counter = length(inputVector);
  for i = 1 : length(inputVector)
      r(i) = sum(inputVector(i : end) .* inputVector(1 : counter));
      % Effort
%       normalizationFactor(i) = length(inputVector) / ( (length(inputVector) - i) * sqrt( (sum(inputVector(i : end) .^ 2)) * (sum(inputVector(1 : counter) .^ 2))) );
      counter = counter - 1;
  end

% r = xcorr(inputVector);

% normalize result
if (bIsNormalized)
    % enter code here
    % Effort
%     r = r .* normalizationFactor;
    
    r = r ./ max(r);
end
r = r';
end