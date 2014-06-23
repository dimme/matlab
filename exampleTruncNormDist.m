% Generate normally distributed data with mu = 0 and sigma = 10
samples = 100000;
mu = 0;
sigma = 10;
data = normrnd(0,10,100000,1);

% Plot the data before truncating it
figure
hist(data,90)
hold on
plot(-50:50,samples.*normpdf(-50:50,mu,sigma),'r-','LineWidth',2)
hold off
legend('Full data','Normal distribution fit')
title('Fit of normal distribution to full data')
xlabel('Value')
ylabel('Number of samples')

% Right-truncate data to -10
dataRightTrunc = data(data <= -10);

% Estimate and plot the fit of a normal distribution to 
% right-truncated data
[mu1,sigma1] = fitTruncNormDist(dataRightTrunc,-10,'right')
figure
hist(dataRightTrunc,40)
hold on
plot(-50:50,samples.*normpdf(-50:50,mu1,sigma1),'r-','LineWidth',2)
hold off
legend('Right-truncated data','Normal distribution fit')
title('Fit of normal distribution to right-truncated data')
xlabel('Value')
ylabel('Number of samples')

% Left-truncate data to 10
dataLeftTrunc = data(data >= 10);

% Estimate and plot the fit of a normal distribution to 
% left-truncated data
[mu2,sigma2] = fitTruncNormDist(dataLeftTrunc,10,'left')
figure
hist(dataLeftTrunc,40)
hold on
plot(-50:50,samples.*normpdf(-50:50,mu2,sigma2),'r-','LineWidth',2)
hold off
legend('Left-truncated data','Normal distribution fit')
title('Fit of normal distribution to left-truncated data')
xlabel('Value')
ylabel('Number of samples')
