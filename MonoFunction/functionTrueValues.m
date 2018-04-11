function [thicknessTruePlot, phaseTruePlot, densityTruePlot] = functionTrueValues(source)

source = load('DataSource.mat');

pixelSize = source.pixelSize;
delta     = source.delta;
lambda    = source.lambda;

radius       = 3E-3;
pixelsRadius = round(radius / pixelSize);

radiusPixels = pixelSize*transpose(linspace(0,pixelsRadius,pixelsRadius));

thicknessTrue = 2 * sqrt(radius^2 - radiusPixels.^2);

radiusPixelsCAT = vertcat(radiusPixels, radiusPixels(end) + radiusPixels);
thicknessTrueCAT = vertcat(flipud(thicknessTrue), thicknessTrue);

phaseTrueCAT     = (2*pi*thicknessTrueCAT*delta)/lambda;

thicknessTruePlot = zeros(400, 1);
thicknessTruePlot(200 - pixelsRadius:200 + pixelsRadius - 1, 1) = thicknessTrueCAT;

phaseTruePlot = zeros(400, 1);
phaseTruePlot(200 - pixelsRadius:200 + pixelsRadius - 1, 1) = phaseTrueCAT;

phaseTruePlot = zeros(400, 1);
phaseTruePlot(200 - pixelsRadius:200 + pixelsRadius - 1, 1) = phaseTrueCAT;

densityTruePlot = zeros(400, 1);
densityTruePlot(200 - pixelsRadius:200 + pixelsRadius - 1, 1) = 2.7 * 1E3;

end