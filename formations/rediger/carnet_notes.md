---
title: Rédiger efficacement son mémoire de thèse
date: 19/03/2024
author: Marius D.
---

## Elements constitutifs de la thèse

19/03/2024

> Ce que l'on va rédiger est différent de ce que l'on a déjà rédigé<!--:citation:-->

En effet,

- Jusqu'à présent : sujet --> résultats
-Maintenant : Sujet complexe --> expliquer comment on a fait, pourquoi on l'a fait ?
-  Démarche --> plan

Démarche ? Choix et actions qui ont été fait --> a **justifier** !

J'ai fait ça sachant que, j'ai fait... --> chemin logique

Il y a un dipole dans toute recherche --> résultats positifs, et négatifs

Comment faire ?

- Au préalable: *Ancrer* son système pour ensuite créer son chemin logique
    - Si programme a évolué peut donc modifier l'intituler du sujet

Le plan en question :

1. Avant-Propos -> Remerciements ;
2. Intro -> Présentation de votre étude dans son contexte ;
3. Biblio -> Présentation des auteurs avant vous ;
4. Matériels et Méthodes -> Présentation des Matériels et Méthodes (focus préalable pour préparer/justifier 5.);

5. Plan de votre démarche -> Choix / Actions / Justifiés
6. Discussion -> Analyse critique +/- de votre travail, qui permet de créer de nouveaux sujets ;
7. Conclusion -> Points forts de votre études ;
8. Annexes -> Ajout d'information ou alléger ;
9. Résumé Général -> Photomaton de votre travail, $10^{\text{aine}}$ de mots clés ;

> Rédiger, c'est structurer, c'est savoir rédiger. <!--:citation:-->

> Lorsque que l'on ne sait pas écrire, c'est qu'il y a des erreurs de structure.<!--:citation:-->

Structure --> On isole le système actif, il y a les parties comme vu précédemment, et le plan de la démarche (chapitres).

> Dans son intro, y'a trop ou y'a pas assez ? <!--:citation:-->

Intro

- Permet de dire d'où vient ce sujet ? Comment je me suis attelé à le résoudre.

Mais comment ça s'est réglé

- Conclusion la réponse à l'intro

Biblio --> Etat de l'art pour mieux comprendre mon résonnement logique.

### Les raporteurs

Ils n'ont pas beaucoup de temps, n'aiment pas lire... ça prend du temps !!!
Ils vont ouvrir et fermer le document, **rarement plus de 20min!!**

Il faut que le document permette une lecture rapide avec au minimum la perte de message.

Il faut éviter l'interprétation du rapporteur.

Objectif: Je vais tout faire pour faciliter la lecture
and
- Visible **graphiquement**
- Il faut les **faire réfléchir!**

> Tel un roman, il faut apper le lecteur, le faire entrer dans le chemin logique

> Cette thèse elle va me ressembler. Je vais en faire mon propre matériau. Ce n'est pas parce que ça n'a pas été fait.

### Contexte

Qu'est ce que c'est ?

- Domaine --> Lié en particulier à ...
  - ploblème général --> dû au fait que ...
  - conséquences négatives --> 

- Etudes  (1 exemple)
  
(auteur A) --> Ils ont fait --> Résultats : Ca leur a permis de montrer... --> Toutefois il y a des limites --> Ils ont montré que... Ils n'ont travailler que sur...

- Bilan général de l'étude des travaux avant vous
  - selectionner 3-4 méthodes qui permettaient de (3-4 points d'appui) --> TOUTEFOIS, il n'y avait pas de méthodes qui pouvait faire... --> D'où mon travail.
TOUTEFOIS est le relais direct

#### Exercices

Contexte:
on s'interesse à la problématique de la combinaison de différentes sources d'information à savoir issu de la simulation et de acquisition de données au cours du temps pour avec une meilleure estimation de l'état réel de notre système

Dû au fait que ses sources d'informations sont soumises à des incertitudes, il est nécessaire de proposer des méthodes qui tiennent compte de celle-ci pour mettre à jour l'état de la simulation et quantifier les incertitudes de l'état mis à jour. 

En ne prenant pas en compte l'assimilation des données mesurées, le système évolant librement, on n'est plus capable de corriger convenablement l'état, ce qui peut entrainer des divergences avec l'état réel.

1) Contexte
   1) Domaine: L'assimilation de données issues de différentes sources d'information pour avoir une meilleure simulation de l'état réel simulé.
   2) Pb: Prendre en compte des données de différentes natures avec leurs incertitudes
   3) Conséquence: Une mauvaise intégration de ces informations, entraine une estimation biaisée de l'état.
2) Etudes

- Kalman a développé une méthode de filtre séquentiel pour estimer l'état d'un système a partir d'une prédiction et de données mesurées à l'instant *t*. Il propose une formulation pratique du filtre Bayésien où l'état et les observations sont définis comment des variables aléatoires. Pour cela cette méthode fait l'hypothèse que les modèles d'évolution et d'observation tous deux linéaires, ainsi que des modèles d'erreur Gaussiens. En pratique il a défini un gain de Kalman pour pouvoir combiner linéairement l'état prédit et l'écart entre prédiction et observation.
- Il a permis d'obtenir la meilleure estimation sans biais, en tenant compte de l'état prédit des observations et de leurs matrices de covariances. Cela a permis de combiner différentes sources d'information, de réduire la variance de l'état mis à jour, à partir d'un schéma efficace basé uniquement sur des produits matrices-vecteurs.
- Il n'a proposé de traiter que des cas linéaires. De plus, elle est limitée à des problèmes de faible dimension et necessite le stockage de la matrice de covariance d'état.
  
- Evensen 1994 a développé une adaptation du filtre de Kalman qui se base sur une estimation des statistiques de l'état et des observations à partir d'un ensemble pour écrire le gain de Kalman. Il réalise une mise à jour de l'ensemble d'état. Il a ainsi permis l'adaptation du filtre de Kalman à des problèmes de grande dimension, pour des modèles non-linéaire. Il a montré que le filtre de Kalman pouvait être approché à l'aide d'un ensemble d'état. Cependant, du fait du modèle non-linéaire, les hypothèses de distribution Gaussienne ne sont plus conservé. Ainsi la distribution obtenue ne converge pas vers la distribution a posteriori. De plus, nécessite de développer des méthodes de localisation et d'inflation pour tenir compte d'erreurs d'échantillonnage.
  
1) Bilan Général
Pour construire un système expert, des méthodes d'assimilation de données ont permis de pouvoir mettre à jour l'état d'une simulation à partir de données mesurées. Grâce à des méthodes ensemblistes, cette étape a été adaptée à des problèmes de grande dimension et non-linéaire. Elle se base sur la définition de l'état assimilé comme combinaison linéaire d'un ensemble de simulation. Si ces méthodes sont adaptées à des simulations partigeant la même discrétisation de l'état
Toutefois
Il n'est pas possible de les utiliser dans le cas de discrétisation particulaire. En effet, chaque simulation a son propre support de particules. D'où mon travail de développer des adaptations pour pouvoir traiter ce cas. 

Liste noire :
    - résultats
    - efficace
    - pertinent
    - proposé
    - valide
  
### Plan de la démarche

1) Caractériser votre sujet --> c'est quoi ?
   - Cette étude consiste à ...
   - La démarche --> Comment ?

### Plan de démarche

#### Chapitres 1

mettre 10 lignes avec

- Objectif justifier: On veut 
- Ciseler les étapes A / B / C
- Puis développement

Finalement, as-t-on répondu à l'objectif ?

On a fait, on a fait d'où on va {insert titre suivant}
plusieurs phrases : "d'où on sait dans la littérature", "on a développé en parallèle", "on a developpé un système et on est allé ailleurs"

On peut imaginer traduire ces paragraphes en anglais par exemple.

### Plan

#### Chapitre 1: Adaptations du Filtre de Kalman d'Ensemble par 
#### Chapitre 1 : Adaptations pour des discrétisations particulaires par adaptations du filtre de Kalman d'Ensemble <!--par correction d'intensité des particulaires ou par génération d'une nouvelle discrétisation particulaire-->

Justifier --> afin de + sachant que...

Afin de mettre à jour 
Pour cela:::afin de-->sachant que
- ON A écrit que la matrice de correction pouvait être définie dans l'espace d'observation AFIN De mettre en évidence que la mise à jour ne dépendant pas de la définition de la discrétisation de l'état ;
<!-- - On a mis en avant que la matrice de correction pouvait être définie dans l'espace d'observation et ne dépendait donc pas de la définition de la discrétisation de l'état -->
- On a montré alors que les états mis à jour sont fonction de toutes les particules de tous les membres
- Afin de réduire le nombre de particules, et donc éviter son accroissement exponentiel, deux méthodes ont été proposées.
- Une méthode qui a projeté la solution sur les particules du membre donnée
  - pour cela
- Une méthode qui a projeté la solution sur une grille puis l'interpoler sur une grille régulière de particules.
  - pour cela
- On a évaluer la qualité des filtres sur un cas 1D et un cas 2D AFIN DE montrer leur convergence
  - on a construit un cas 1D
  - on a construit un cas 2D avec la méthode Vortex


#### Chapitre 2 : Evaluation de la capacité des méthodes développées à assimiler les données sur plusieurs applications

- On a reformulé le problème en attroduisant une transformation --> sachant que ca a déjà été fait dans la biblio
- On proposé une formulation en deux étapes défini par une correction dans l'espace de membres
- 

Attention: si choix ou selection, pour cela --> étude biblio