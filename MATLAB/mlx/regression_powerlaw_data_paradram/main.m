%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%
%%%%    Description:
%%%%        +   Run the serial Monte Carlo sampler of the ParaMonte library given the input log-target density function `getLogFunc()`.
%%%%    Output:
%%%%        +   The simulation output files.
%%%%    Author:
%%%%        +   Computational Data Science Lab, Monday 9:03 AM, May 16 2016, ICES, UT Austin
%%%%    Visit:
%%%%        +   https://www.cdslab.org/paramonte
%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear MATLAB space

clc;
clear all;
close all;
clear classes;
format compact; format long;

% set path to the ParaMonte library

%%%%%%%%%%%%% IMPORTANT %%%%%%%%%%%%%

pmlibRootDir = './'; % change this path to the ParaMonte library root directory

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath(genpath(pmlibRootDir));

% change MATLAB's working directory to the folder containing this script

filePath = mfilename('fullpath');
[currentDir,fileName,fileExt] = fileparts(filePath); cd(currentDir);
cd(fileparts(mfilename('fullpath'))); % Change working directory to source code directory.

% instantiate an object of class logfunc containing:
%     - the objective function (getLogFunc)
%     - its number of dimensions (NDIM)

NDIM = 3;

X = [0.5, 2.4, 3.2, 4.9, 6.5, 7.8];
Y = [0.8, 9.3, 37.9, 68.2, 155, 198];

global logX logY
logX = log(X);
logY = log(Y);


% create a ParaMonte object:

pm = paramonte();

% create a ParaDRAM simulation object

pmpd = pm.ParaDRAM();

% NOTE: For a complete list of simulation specifications, see:
% NOTE:
% NOTE:     https://www.cdslab.org/paramonte/notes/usage/paradram/specifications/

pmpd.spec.chainSize = 30000;            % the number of uniquely-sampled points
pmpd.spec.outputFileName = "./out/";    % only the output folder specified here in the above, implying that
                                        % the filenames are to be generated automatically by the sampler.

% run the ParaDRAM simulation

pmpd.runSampler ( NDIM ... number of dimensions of the objective function
                , @getLogFunc ... the objective function: multivariate normal distribution
                );
