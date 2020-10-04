% Download this file and place it in the same folder whether 
% the ParaMonte MATLAB live scripts exist on your system.
% This script will cause the working directory of the 
% Live Scripts to the same location where they exist,
% instead of a temporary folder created by MATLAB.

filePath = mfilename('fullpath');
[currentDir,fileName,fileExt] = fileparts(filePath); cd(currentDir);
cd(fileparts(mfilename('fullpath'))); % Change working directory to source code directory.