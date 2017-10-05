function r = compAcf (inputVector, bIsNormalized)

    % set uninitialized input arguments
    if (nargin < 2)
        bIsNormalized = true;
    end

    % check input dimension
    [m,n] = size(inputVector);
    if ((m<=1 && n<=1) || (m>1 && n>1))
        error('illegal input vector');
    end

    % allocate memory for result
    r = zeros(size(inputVector));

    % compute acf
    % enter code here
    counter = n;
    for i = 1 : n
        r(1, i) = sum(inputVector(i : end) .* inputVector(1 : counter));
        counter = counter - 1;
    end

    % normalize result
    if (bIsNormalized)
        % enter code here
        r = r ./ max(r);
    end
end