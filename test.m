% Generate normally distributed data with mu = 0 and sigma = 10
data = normrnd(0,10,100000,1);

% Right-truncate data to -10
dataRightTrunc = data(data <= -10);

% Left-truncate data to 10
dataLeftTrunc = data(data >= 10);

% Estimate the fit of a normal distribution to right-truncated data
[mu1,sigma1] = fitTruncNormDist(dataRightTrunc,-10,'right')

% Estimate the fit of a normal distribution to left-truncated data
[mu2,sigma2] = fitTruncNormDist(dataLeftTrunc,10,'left')
