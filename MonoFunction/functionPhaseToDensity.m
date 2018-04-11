function [density] = functionPhaseToDensity(phase, thickness, lambda)

phase(phase > -0.15) = 0;

r0 = 2.82E-15;

eDensity = -(phase) ./ (r0 * thickness * lambda);

atomicNumber = 13;
atomicMassNumber = 27;
dalton = 1.660E-27;

numAtoms = eDensity / atomicNumber;

atomicMass = atomicMassNumber *  dalton;

totalMass = numAtoms * atomicMass;

density = totalMass / 1;

end
