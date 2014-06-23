function [ mu, sigma ] = fitTruncNormDist( truncData, truncPoint, side )
%FITTRUNCNORMDIST Fitting of data to a truncated normal distribution
%   This function takes a dataset and fits it to a truncated normal 
%   distribution.

    if strcmp(side,'right')
        truncNormPdf = @(x,mu,sigma) normpdf(x,mu,sigma) ./ normcdf(truncPoint,mu,sigma);
        start = [mean(truncData),std(truncData)];
        paramEsts = mle(truncData,'pdf',truncNormPdf,'start',start,'lower',[-Inf 0]);
        mu = paramEsts(1);
        sigma = paramEsts(2);
    elseif strcmp(side,'left')
        [mu,sigma] = fitTruncNormDist(-truncData,-truncPoint,'right');
        mu = -mu;
    else
        mu = 0;
        sigma = 0;
        disp('The side has to be left or right')
    end
end

