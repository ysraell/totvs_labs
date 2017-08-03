%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Only to load the sampĺe.json
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To load JSON database in MATLAB format:
addpath ./jsonlab-1.5
% Load the database
data = loadjson('sample.json');

save sample.mat data
