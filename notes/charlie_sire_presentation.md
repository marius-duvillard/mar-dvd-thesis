# Quantization methods for the visualization of the flooding risk

test case: 

- Les Boucholeur, près de la Rochelle (feb 2010)
- Loire près d'Orléans

Simulation complexes et longues (méthode boite noire)
Données sont le max niveau de l'eau dans l'espace --> 1 pixel = 25m.

input : offshore conditions (coastal), hydro paramerts (river), calibrated parameters, breaches parameters (RV) --> scalar variable

output : flooding map

popagation d'incertitude pour avoir la distribution des outputs

challenge: require calls to the simulators
événements rares
minimise l'erreur de quantification (Pagès 2014) --> Kmean et Lloyd algo
evmt rare -> cluster avec peu d'échantillon
donc utilise importance sampling
réécrit avec la quantization

GP pour Y. Training in the HLS

As sampling density --> uniform sampling in the hypercube

## Influence of input distrubiton on the flooding regimes

adapt Lloyd algo to unifiomr and dirac distribution 
