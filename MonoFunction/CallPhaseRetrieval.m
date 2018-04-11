close all
clear all
clc

%% Load simulated phase contrast image and X-ray data

data   = load('ID30keV_6mm_Al_cylinder_400px_M-1.mat');
source = load('DataSource.mat');

%% Run phase retrieval

[thickness, phase, density]                         = function_PhaseRetrievalMono(data, source);
      
[thicknessTruePlot, phaseTruePlot, densityTruePlot] = functionTrueValues(source);