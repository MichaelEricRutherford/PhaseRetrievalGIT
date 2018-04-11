function [thickness, phase, density, contrast] = function_PhaseRetrievalMono(data, source)

%% Make contrast image and check magnification

oneRow             = data.I(:,1);

for n = 1:250
    contrast(n,:)  = oneRow;
end

%% Read source parameters

M                  = source.M;
pixelSize          = source.pixelSize;

zPropagation       = source.zPropagation;
energyWeightedkeV  = source.energyWeightedkeV;
electricCharge     = source.electricCharge;
h                  = source.h;
c                  = source.c;
EJ                 = energyWeightedkeV * electricCharge * 1E3;
nu                 = source.nu;
lambda             = source.lambda;

delta              = source.delta;
beta               = source.betaPE;
muPELinear	       = source.muPELinear;

%% Padding

contrastPAD        = functionPadContrast(contrast, lambda, pixelSize);

%% Contrast

contrastOG         = contrast;
contrast           = contrastPAD;

Fcontrast          = fftshift(fft2(contrast));

%% Coordinates

[ySize, xSize]     = size(contrast);

x                  = transpose(linspace(1, xSize, xSize)) * pixelSize;
y                  = transpose(linspace(1, ySize, ySize)) * pixelSize;

nX                 = length(x);
nY                 = length(y);

kMaxX              = 1 / (2*pixelSize);
kMaxY              = 1 / (2*pixelSize);

kX                 = linspace(-kMaxX,kMaxX,nX);
kY                 = linspace(-kMaxY,kMaxY,nY);

[kXGrid, kyGrid]   = meshgrid(kX,kY);

%% Transport of Intensity phase retrieval

[thickness, phase] = functionPhaseRetrievalTIE(Fcontrast, zPropagation, delta, beta, muPELinear, lambda, kXGrid, kyGrid);

[density]          = functionPhaseToDensity(phase, thickness, lambda);

end