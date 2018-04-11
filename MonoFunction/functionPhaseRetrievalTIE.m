%% Transport of Intensity phase retrieval

function [thickness, phase] = functionPhaseRetrievalTIE(Fcontrast, zPropagation, delta, betaPE, muPELinear, lambda, kXGrid, kyGrid)

tieArgument = Fcontrast ./ (1 + (zPropagation*delta/muPELinear) * (kXGrid.^2+kyGrid.^2));
thickness   = -(1/muPELinear) * log(ifft2(ifftshift(tieArgument)));
thickness   = real(thickness);
thickness   = thickness(4:end-3, 57:end-56);

tieArgument = Fcontrast ./ (1 + (zPropagation*delta*lambda/(4*pi*betaPE)) * (kXGrid.^2+kyGrid.^2));
phase   = (delta/(2*betaPE)) * log(ifft2(ifftshift(tieArgument)));
phase   = real(phase);
phase   = phase(4:end-3, 57:end-56);

end