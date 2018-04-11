function contrastPAD = functionPadContrast(contrast, lambda, pixelSize)

[nX, nY] = size(contrast);

nMargin = ceil((3*lambda*6)/(pixelSize^2));

dummy = zeros(nX+(2*nMargin), nY+(2*nMargin));

[nXDash, nYDash] = size(dummy);

np2_nXDash = nextpow2(nXDash);
np2_nYDash = nextpow2(nYDash);

dummynp2   = zeros(2^np2_nXDash, 2^np2_nYDash);

contrastPAD  = padarray(contrast, [ceil((size(dummynp2,1)-nX)/2) ceil((size(dummynp2,2)-nY)/2)], 'replicate', 'both');

end