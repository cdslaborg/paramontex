%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%
%%%%  Author:
%%%%        +   Computational Data Science Lab, Monday 9:03 AM, May 16 2016, ICES, UT Austin
%%%%  Visit:
%%%%        +   https://www.cdslab.org/paramonte
%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function logLike = getLogFunc(param)
    %   =======================================================================
    %
    %   Return the natural logarithm of the likelihood of observing the (X,Y) dataset defined
    %   globally outside of this function given the input parameter vector ``param``.
    %
    %   Parameters
    %   ==========
    %
    %       param
    %           A 64-bit real vector containing the parameters of the model in the following order:
    %           intercept, slope, log(sigma) (standard deviation of the Normal distribution).
    %
    %   Returns
    %   =======
    %
    %       logLike
    %           The natural logarithm of the likelihood of observing the dataset (X,Y) given ``param``.
    %
    %   =======================================================================

    % Declare the global data

    global logX logY

    %   Compute the expected value of y, given each value of x.
    %   This is the mean of the Normal distribution given the x values.

    %expectedLogY = getExpectedLogY(logX,param(1:2));
    expectedLogY = param(1) + param(2) * logX;

    %   Compute the log-PDFs of oberserving each data point given the inpur parameters.

    logProbDensities = log(normpdf(logY, expectedLogY, exp(param(3)))); % Note that param(3) is logSigma.

    %   Compute and return the log-likliehood

    logLike = sum(logProbDensities);

end