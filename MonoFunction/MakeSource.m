%% Source

zPropagation      = 7;
energyWeightedkeV = 30;
electricCharge    = 1.60217662E-19;
h                 = 6.62607004E-34;
c                 = 299792458;
EJ                = energyWeightedkeV * electricCharge * 1E3;
nu                = EJ / h;
lambda            = c / nu;

delta             = 6.01E-07;
betaPE            = 7.61E-10;
muPELinear	      = 2.31392*100;

M                 = 1.1307;
pixelSize         = 32E-6 / M;

save('DataSource.mat');