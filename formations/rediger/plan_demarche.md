# Plan de démarche

## Chapitre 1 : Développement de méthodes par correction d'intensité pour permettre l'adaptation du filtre de Kalman d'ensemble aux simulations sans maillage

### Pour cela Mise en évidence de la correction à appliquer pour mettre à jour les états
#### Objectifs: construire des adaptations de filtre de Kalman d'Ensemble pour des simulation sans maillage.
#### Corps
- SACHANT QUE: la correction est CL des membres dans le filtre de Kalman
- POUR CELA: Reformulation d'une correction indépendante de la discrétisation des états
  - SACHANT QUE: l'ensemble des états ont des discrétisations différentes
  - POUR CELA : écriture de de mise à jour des états
    - SACHANT QUE: ...
- Développement de méthodes de mise à jour des discrétisations particulaires
  - SACHANT QUE
  - POUR CELA On se ramène à un problème 
    - POUR CELA Développement d'un schéma avec projection intermédiaire sur grille
    - SACHANT QUE 
<!-- 
- Construction de filtres permettant la correction des états définit par des discrétisations particulaires
  - SACHANT QUE
  - POUR CELA -->

#### Bilan

- ON A développé deux méthodes pour adapter le filtre EnKF à des simulations particulaires 
- MAIS on n'a pas validées ces filtres, en particulier dans des cas où les supports de particules ne chevauchent pas
- D'OU on va vérifier leur capacité à assimiler des données sur plusieurs applications

## Chapitre 2 : Evaluation de la capacité des méthodes développées à assimiler les données sur plusieurs applications

#### Objectif

- POUR CELA : 
  - POUR CELA : on a fait varier  
  - SACHANT QUE : 

#### Bilan 

- ON A mis en évidence les limites des méthodes en particulier les limites liés au support ne correspond pas à la solution à analyser
- ON A PAS Proposé des méthodes dans le cas où les intensités ne peuvent pas être modifié (ref)
- ON A PAS Proposé de méthodes qui soient cinématiquement admissible SACHANT QUE c'est le cas pour DEM par exemple (ref)
- D'OU on va chercher à corriger le support des particules grâce à une étape d'alignement
- D'OU on va formuler le problème d'assimilation pour prendre en compte l'erreur d'alignement


## Chapitre 3 : Développement de méthodes d'assimilation de donnée par correction de position pour des simulations sans maillage

#### Objectif:

#### Bilan:

- ON A développé une formulation du problème d'assimilation de données en introduisant une transformation pour aligner les particules
- ON A proposé une méthodologie

## Chapitre 4 :Evaluation et comparaison des méthodes de correction de position et d'intensité
#### Objectif:

#### Bilan:
