# Plan de démarche

## Chapitre 1 : Développement de méthodes par correction d'intensité pour permettre l'adaptation du filtre de Kalman d'ensemble aux simulations sans maillage

### Pour cela Mise en évidence de la correction à appliquer pour mettre à jour les états
#### Objectifs: construire des adaptations de filtre de Kalman d'Ensemble pour des simulation sans maillage.
#### Corps
- SACHANT QUE: la correction est CL des membres dans le filtre de Kalman
- Réformulation de la mise à jour en déterminant une correction dans l'espace d'observation
- POUR CELA: Reformulation d'une correction indépendante de la discrétisation des états.
  - SACHANT QUE: l'ensemble des états ont des discrétisations différentes
  - POUR CELA : écriture de de mise à jour des états dans l'espace d'observation
    - SACHANT QUE: celui ci est supposé défini à l'aide d'une discrétisation eulérienne et que l'on peut alors écrire un terme de correction.
- Développement de méthodes de mise à jour des discrétisations particulaires
  - SACHANT QUE: Tous les membres n'ont pas les mêmes discrétisations particulaires
  - POUR CELA: On traite d'abord le cas de membre avec la meme discrétization, on montre le problème dans le cas général
    - SACHANT QUE l'on peut d'une part changer totalement la disposition particulaire
      - POUR CELA On utilise des méthodes de redistribution pour remailler
    - SACHANT QUE l'on ne veut pas changer la position des particules et que l'on souhaite proposer une mise à jour purement particulaire
      - POUR CELA on développe une méthode de mise à jour des intensités
        - SACHANT que l'on peut évaluer les champs analysés, on peut mettre en place des méthodes d'approximation
          - POUR CELA On décrit une méthode de quadratude et une méthode de regression pour approcher les solutions

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
Deux adaptations du filtre EnKF ont été proposées pour être... 

- reprendre plan article 1

#### Bilan 

- ON A mis en évidence les limites des méthodes en particulier les limites liés au support ne correspond pas à la solution à analyser
- ON A PAS Proposé de méthodes pour corriger le support dans ce cas
- ON A PAS Proposé des méthodes dans le cas où les intensités ne peuvent pas être modifié (ref)
- ON A PAS Proposé de méthodes qui soient cinématiquement admissible SACHANT QUE c'est le cas pour DEM par exemple (ref)
- D'OU on va chercher à corriger le support des particules grâce à une étape d'alignement
- D'OU on va formuler le problème d'assimilation pour prendre en compte l'erreur d'alignement

## Chapitre 3 : Développement de méthodes d'assimilation de donnée par correction de position pour des simulations sans maillage

#### Objectif :

SACHANT QUE Les filtres EnKF jusqu’ici mettent uniquement à jour les intensités des particules 
  ON DOIT tenir compte de distribution non admissible.
SACHANT QUE les méthodes particulaires discrètes n'admettent pas de correction par intensité, 
  ON DOIT proposer des méthodes qui mettent à jour la position des particules.
SACHANT QUE la mise à jour va dépendre de la méthode d'intégration 
  ON DOIT donc prendre en compte la physique pour modifier les positions de particule. On parlera de méthodes cinématiquement admissible.
ON SAIT QUE des méthodes dans la littérature cherche à tenir compte d'erreur de positionnement et de proposer des méthodes d'assimilation avec des métriques plus complexes que simplement une norme euclidienne sur les intensités.
--> prendre en compte les remarque de la présentation d'avril.

FINALEMENT en s'inspirant de la littérature en assimilation de données, on propose une catégorie de méthodes qui permettent d'améliorer le filtre Part-EnKF en supposant une erreur dans le positionnement de la discrétisation particulaire.

#### Corps :


La discrétisation particulaire des membres peut être inadaptée pour le filtre Part-EnKF
Comment proposer une discrétisation mieux adaptée à la solution analysée ?

Proposer une formulation du problème qui tient compte de l’erreur d’alignement des membres
Corriger la position des particules en plus des intensités, avoir une discrétisation particulaire conforme à la solution analysée
Proposer un alignement cinématiquement admissible

POUR CELA On souhaite proposer des méthodes qui modifie la position des particules
SACHANT QUE Dans la littérature on peut tenir compte de l'erreur d'alignemebt
  POUR CELA on a des méthodes pour corriger l'alignement
POUR CELA on définit une méthode séquentielle pour corriger l'intensité
    - SACHANT QUE on a des cas dans la littérature où on fait justement ce découplage
      - POUR CELA on applique successivement l'étape d'alignement puis l'étape de correction d'intensité
      - SACHANT QUE la correction d'intensité n'est autre que les filtres présentés en Chapitre 1.
POUR CELA on doit définir une méthode d'assimilation par alignement.
SACHANT QUE la mise à jour va dépendre de la méthode d'intégration on est dépendant de la physique.
  POUR CELA nous travaillerons directement avec la méthode vortex.
    SACHANT QUE il existe déjà une méthode d'alignement pour discrétiser un champ vortex, on va s'en inspirer pour développer notre propre méthode. 
  POUR CELA on doit proposer une méthode pour aligner les particules
  SACHANT QUE l'on doit faire une correction physiquement admissible
  POUR CELA on défini une transformation adéquat
  SACHANT QUE l'on souhaite résoudre un problème d'assimilation 
  POUR CELA on défini un problème d'optimisation
  SACHANT QUE le problème à résoudre dépend d'un champ de correction à discrétiser
  POUR CELA on défini une base de correction
    SACHANT QUE on suppose de l'origine de l'erreur
    POUR CELA on corrige en fonction des champs de vitesse même généré par l'ensemble
  SACHANT QUE l'on a uniquement corriger les positions


Chapitre
- 1 Assimilation de données par alignement
- 2 Définition d'une méthode d'assimilation d'ensemble variationnelle non-linéaire séquentielle
- 3 Correction de position appliquée à la méthode vortex
  - 3.1 Transformation cinématiquement admissible de la distribution particulaire
      - bien dire que ça ne va donc proposer que des transformations à divergence nulle. La correction d'intensité permettra alors de proposer des corrections orthogonales si possible.s
  - 3.2 Définition de l'espace de recherche
  - 3.3 Réécriture du problème d'optimisation

#### Bilan:

- ON A développé une formulation du problème d'assimilation de données en introduisant une transformation pour aligner les particules
- ON A une formule variationnelle
  - ON A une méthode qui peut être combinée avec la précédente
- ON A une classe de méthode qui pourrait être étendu à des problèmes sans maillage discrets.
- ON A PAS encore illustré mes performances de cette méthode, on propose de définir un problème qui présente une situation ou la distribution des membres devient inadmissible et 
  
## Chapitre 4: Evaluation et comparaison des méthodes de correction de position et/ou d'intensité

#### Objectif:
- SACHANT QUE l'on a développé une méthode pour modifier la position des particules pour une méthode sans maillage
  - POUR CELA évaluer la méthode d'assimilation par correction de positions
  - SACHANT QUE cela a été pris en compte avec la méthode vortex
    - POUR CELA on définit un cas test qui traite un cas d'erreur d'alignement qui induit des discrétisations non admissiobles.

#### Corps

- SACHANT QUE l'on travaille avec la méthode vortex
- POUR CELA on défini un problème
  - SACHANT QUE on doit présenter un cas avec des discrétisations non admissibles
    - POUR CELA on présente un problème à trois corps dont les trajectoires des centres des vortex vont être chaotiques.
- POUR CELA 

#### Bilan:

# Chapitre 5: Perspective