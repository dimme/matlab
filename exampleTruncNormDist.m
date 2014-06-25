% Generate normally distributed data with mu = 0 and sigma = 10
samples = 10000;
mu = -90;
sigma = 10;
data = normrnd(mu,sigma,samples,1);

% Plot the data before truncating it
figure
hist(data,90)
hold on
xvals = (mu-5*sigma):(mu+5*sigma);
plot(xvals,samples.*normpdf(xvals,mu,sigma),'r-','LineWidth',2)
hold off
legend('Full data','Normal distribution fit')
title('Fit of normal distribution to full data')
xlabel('Value (e.g. dBm)')
ylabel('Number of samples')

% Right-truncate data to -10
dataRightTrunc = data(data <= -100);

% Estimate and plot the fit of a normal distribution to 
% right-truncated data
[mu1,sigma1] = fitTruncNormDist(dataRightTrunc,-100,'right')
figure
hist(dataRightTrunc,40)
hold on
xvals1 = (mu1-5*sigma1):(mu1+5*sigma1);
plot(xvals1,samples.*normpdf(xvals1,mu1,sigma1),'r-','LineWidth',2)
hold off
legend('Right-truncated data','Normal distribution fit')
title('Fit of normal distribution to right-truncated data')
xlabel('Value (e.g. dBm)')
ylabel('Number of samples')

% Left-truncate data to 10
dataLeftTrunc = data(data >= -80);

% Estimate and plot the fit of a normal distribution to 
% left-truncated data
[mu2,sigma2] = fitTruncNormDist(dataLeftTrunc,-80,'left')
figure
hist(dataLeftTrunc,40)
hold on
xvals2 = (mu2-5*sigma2):(mu2+5*sigma2);
plot(xvals2,samples.*normpdf(xvals2,mu2,sigma2),'r-','LineWidth',2)
hold off
legend('Left-truncated data','Normal distribution fit')
title('Fit of normal distribution to left-truncated data')
xlabel('Value (e.g. dBm)')
ylabel('Number of samples')
