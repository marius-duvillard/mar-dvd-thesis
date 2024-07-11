Pour la progression, des couleurs sont définies dans [preambule.tex](preamble.tex) avec les commandes `\lg_color{}` et `\olm_color{}`.
## Progression

- **Introduction**  
  - Contexte Général ![](https://geps.dev/progress/100) 
    - Contexte Industriel  (paragraph) ![](https://geps.dev/progress/100) 
    - Fabrication du combustible de fission  (paragraph) ![](https://geps.dev/progress/100) ![](https://geps.dev/progress/100) 
    - Broyeur à boulets (paragraph) ![](https://geps.dev/progress/100) 
    - Régimes d'écoulement et simulation (paragraph) ![](https://geps.dev/progress/100) 
    - Méthodes de mesures (paragraph) ![](https://geps.dev/progress/100) 
    - Concept de Jumeau Numérique (paragraph) ![](https://geps.dev/progress/100) 
  - Objectifs ![](https://geps.dev/progress/100) 
  
- **Assimilation de données**
  - Objectifs
  - Définitions
    - Etat
    - Observations
    - Inférence bayésienne récursive
    - Estimation des paramètres du modèle par augmentation de l'état
  - Filtrage bayésien
  - Propagation (à mettre dans la section précédente)
  - Filtre de Kalman
  - Filtre de Kalman d'ensemble (EnKF)
  - Méthodes variationnelles
    - Estimation du Maximum a Posteriori
    - Méthode 3DVar
    - Equivalence avec la mise à jour de Kalman
  - Méthode variationnelle d'ensemble
    - Maximum de vraissemblance échantillonné
    - Méthode de faible rang
  - Méthodes d'assimilation tenant compte de l'erreur d'alignement
  - Bilan - classification des filtres
  - Conclusion
  
- **Modélisation sans maillage et assimilation de données**
  - Méthodes de simulation du mélange
  - Méthodes sans maillage discrètes
    - Méthode des éléments discrets (DEM)
  - Méthodes sans maillage continus
    - Modélisation
      - Discrétisation particulaire
      - Exemples de fonctions noyau
    - Hydrodynamique des particules lissées, \textit{Smoothed particle hydrodynamics} (SPH)
    - Méthode des points matériaux (\textit{Material Point Method}, MPM)
    - Méthode Vortex
      - Schéma
      - Similarité avec SPH et MPM
    - Méthode continus et assimilation de données
  - Conclusion

- **Développement de méthodes permettant l'adaptation du filtre de Kalman d'ensemble avec des simulations sans maillage**
  - Objectifs
  - Mise à jour défini dans l'espace des membres
  - Mise à jour comme solution particulaire
  - Remesh-EnKF : Générer une même configuration particulaire
    - Méthode de remaillage pour obtenir un support de particule commun
    - Algorithme
  - Part-EnKF : Mise à des intensités
    - Approximation d'un champs continu par une discrétisation particulaire
      - Approximation particulaire
      - Régression de fonction de base radiale (Radial Basis Function Regression (RBF))
    - Algorithme
  - Complexité
  - Bilan

-  **Evaluation de la capacité des méthodes développées à assimiler les données sur plusieurs applications**
   - Objectifs
   - Problème 1D d'advection diffusion
   - Problème 2D 
   - Bilan

